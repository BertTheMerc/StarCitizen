
// src/pages/LootablesPage.tsx
import { useEffect, useMemo, useState } from 'react'

import type { LootItem, LootQuery, LootableSortKey } from '../types/loot'
import { defaultLootQuery } from '../types/loot'
import type { SortOrder } from '../types/shared'
import { readLootQuery, writeLootQuery } from '../query/lootableQuery' 

export default function LootablesPage() {

    const [allItems, setAllItems] = useState<LootItem[]>([])
    const [loading, setLoading] = useState(true)
    const [error, setError] = useState<string | null>(null)
    const [filters, setFilters] = useState<LootQuery>(readLootQuery)

    useEffect(() => {
        const onPopState = () => setFilters(readLootQuery())
        window.addEventListener('popstate', onPopState)

        const load = async () => {
            try {
                setLoading(true)
                setError(null)
                const response = await fetch('/api/loot')
                if (!response.ok) {
                    throw new Error(`Unable to load loot list (${response.status})`)
                }

                const data: LootItem[] = await response.json()
                setAllItems(data)
            } catch (loadError) {
                setError(loadError instanceof Error ? loadError.message : 'Failed to load lootables')
            } finally {
                setLoading(false)
            }
        }

        void load()

        return () => window.removeEventListener('popstate', onPopState)
    }, [])

    const itemTypeOptions = useMemo(
        () => [...new Set(allItems.map((item) => item.itemType).filter(Boolean))].sort((left, right) => left.localeCompare(right)),
        [allItems],
    )

    const subTypeOptions = useMemo(
        () =>
            [
                ...new Set(
                    allItems
                        .filter((item) => !filters.type || item.itemType.toLowerCase() === filters.type.toLowerCase())
                        .map((item) => item.subType)
                        .filter(Boolean),
                ),
            ].sort((left, right) => left.localeCompare(right)),
        [allItems, filters.type],
    )

    const lootvisible = useMemo(() => {
        const term = filters.q.trim().toLowerCase()

        const filtered = allItems.filter((item) => {
            if (term.length > 0) {
                const haystack = `${item.itemName} ${item.itemType} ${item.subType}`.toLowerCase()
                if (!haystack.includes(term)) return false
            }

            if (filters.type && item.itemType.toLowerCase() !== filters.type.toLowerCase()) return false
            if (filters.sub && item.subType.toLowerCase() !== filters.sub.toLowerCase()) return false
            return true
        })

        const sorted = [...filtered].sort((left, right) => {
            const compare = (a: string | number, b: string | number) => (a > b ? 1 : a < b ? -1 : 0)

            switch (filters.sort) {
                case 'itemtype':
                    return compare(left.itemType, right.itemType) || compare(left.itemName, right.itemName)
                case 'subitemtype':
                    return compare(left.subType, right.subType) || compare(left.itemName, right.itemName)
                case 'return':
                    return compare(left.return, right.return) || compare(left.itemName, right.itemName)
                case 'sell':
                    return compare(left.cargoSaleValue, right.cargoSaleValue) || compare(left.itemName, right.itemName)
                case 'size':
                    return compare(left.scuSize, right.scuSize) || compare(left.itemName, right.itemName)
                default:
                    return compare(left.itemName, right.itemName)
            }
        })

        if (filters.desc === 'yes') {
            sorted.reverse()
        }

        return sorted
    }, [allItems, filters])

    const apply = () => writeLootQuery(filters)

    const reset = () => {
        setFilters(defaultLootQuery)
        writeLootQuery(defaultLootQuery)
    }

    return (
        <>
            <h1 className="h1">Lootables</h1>
            {loading ? (
                <p className="p">
                    <em>Loading...</em>
                </p>
            ) : error ? (
                <p className="p">{error}</p>
            ) : (
                <div className="grid">
                    <div className="panel">
                        <div className="field">
                            <label htmlFor="loot-search">Search</label>
                            <input
                                id="loot-search"
                                className="input"
                                value={filters.q}
                                onChange={(event) => setFilters((current) => ({ ...current, q: event.target.value }))}
                                placeholder="Name / type / subtype…"
                            />

                            <label htmlFor="loot-type">Item Type</label>
                            <select
                                id="loot-type"
                                className="select"
                                value={filters.type}
                                onChange={(event) => setFilters((current) => ({ ...current, type: event.target.value, sub: '' }))}
                            >
                                <option value="">All</option>
                                {itemTypeOptions.map((item) => (
                                    <option key={item} value={item}>
                                        {item}
                                    </option>
                                ))}
                            </select>

                            <label htmlFor="loot-subtype">Item Sub Type</label>
                            <select
                                id="loot-subtype"
                                className="select"
                                value={filters.sub}
                                onChange={(event) => setFilters((current) => ({ ...current, sub: event.target.value }))}
                            >
                                <option value="">All</option>
                                {subTypeOptions.map((item) => (
                                    <option key={item} value={item}>
                                        {item}
                                    </option>
                                ))}
                            </select>

                            <label htmlFor="loot-sort">Sort</label>
                            <select
                                id="loot-sort"
                                className="select"
                                value={filters.sort}
                                onChange={(event) => setFilters((current) => ({ ...current, sort: event.target.value as LootableSortKey }))}
                            >
                                <option value="itemtype">Item Type</option>
                                <option value="subitemtype">Sub Item Type</option>
                                <option value="return">Return</option>
                                <option value="name">Name</option>
                                <option value="sell">Sell value</option>
                                <option value="size">Size</option>
                            </select>

                            <label htmlFor="loot-order">Order</label>
                            <select
                                id="loot-order"
                                className="select"
                                value={filters.desc}
                                onChange={(event) => setFilters((current) => ({ ...current, desc: event.target.value as SortOrder }))}
                            >
                                <option value="no">Lowest</option>
                                <option value="yes">Highest</option>
                            </select>
                        </div>

                        <div className="row top-margin">
                            <button type="button" className="btn fixed-width" onClick={apply}>
                                Apply
                            </button>
                            <button type="button" className="btn fixed-width" onClick={reset}>
                                Reset
                            </button>
                        </div>

                        <div className="kpi">
                            <span className="badge">Results: {lootvisible.length}</span>
                            <span className="badge">Total: {allItems.length}</span>
                        </div>
                    </div>

                    <div className="panel">
                        <table className="table">
                            <thead>
                                <tr>
                                    <th>Item Type</th>
                                    <th>Sub Type</th>
                                    <th>Name</th>
                                    <th>Size</th>
                                    <th>Sell value</th>
                                    <th>Return</th>
                                </tr>
                            </thead>
                            <tbody>
                                {lootvisible.map((item) => (
                                    <tr key={`${item.itemName}-${item.subType}`}>
                                        <td>{item.itemType}</td>
                                        <td>{item.subType}</td>
                                        <td>{item.itemName}</td>
                                        <td>{item.scuSize}</td>
                                        <td>{item.cargoSaleValue}</td>
                                        <td>{item.return}</td>
                                    </tr>
                                ))}
                            </tbody>
                        </table>
                    </div>
                </div>
            )}
        </>
    )
}