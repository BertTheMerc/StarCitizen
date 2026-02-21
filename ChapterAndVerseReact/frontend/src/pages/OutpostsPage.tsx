import { useEffect, useMemo, useState } from 'react'
import type { OutpostItem, OutpostQuery, OutpostSortKey } from '../types/outposts' 
import type { SortOrder } from '../types/shared'
import { defaultOutpostQuery } from '../types/outposts'
import { readOutpostQuery, writeOutpostQuery } from '../query/outpostQuery' 

export default function OutpostsPage() {
        const [allItems, setAllItems] = useState<OutpostItem[]>([])
        const [loading, setLoading] = useState(true)
        const [error, setError] = useState<string | null>(null)
        const [filters, setFilters] = useState<OutpostQuery>(readOutpostQuery)

        useEffect(() => {
            const onPopState = () => setFilters(readOutpostQuery())
            window.addEventListener('popstate', onPopState)

            const load = async () => {
                try {
                    setLoading(true)
                    setError(null)
                    const response = await fetch('/api/outposts')
                    if (!response.ok) {
                        throw new Error(`Unable to load outpost list (${response.status})`)
                    }

                    const data: OutpostItem[] = await response.json()
                    setAllItems(data)
                } catch (loadError) {
                    setError(loadError instanceof Error ? loadError.message : 'Failed to load outposts')
                } finally {
                    setLoading(false)
                }
            }

            void load()

            return () => window.removeEventListener('popstate', onPopState)
        }, [])

        const systemOptions = useMemo(
            () => [...new Set(allItems.map((item) => item.systemName).filter(Boolean))].sort((left, right) => left.localeCompare(right)),
            [allItems],
        )

        const subsystemOptions = useMemo(
            () =>
                [
                    ...new Set(
                        allItems
                            .filter((item) => !filters.systemname || item.systemName.toLowerCase() === filters.systemname.toLowerCase())
                            .map((item) => item.subSystemName)
                            .filter(Boolean),
                    ),
                ].sort((left, right) => left.localeCompare(right)),
            [allItems, filters.systemname],
        )

        const areaOptions = useMemo(
            () =>
                [
                    ...new Set(
                        allItems
                            .filter((item) => !filters.systemname || item.systemName.toLowerCase() === filters.systemname.toLowerCase())
                            .filter((item) => !filters.subsystemname || item.subSystemName.toLowerCase() === filters.subsystemname.toLowerCase())
                            .map((item) => item.area)
                            .filter(Boolean),
                    ),
                ].sort((left, right) => left.localeCompare(right)),
            [allItems, filters.systemname, filters.subsystemname],
        )

        const outpostvisible = useMemo(() => {
            const term = filters.q.trim().toLowerCase()

            const filtered = allItems.filter((item) => {
                if (term.length > 0) {
                    const haystack = `${item.systemName} ${item.subSystemName} ${item.outpostName}`.toLowerCase()
                    if (!haystack.includes(term)) return false
                }

                if (filters.systemname && item.systemName.toLowerCase() !== filters.systemname.toLowerCase()) return false
                if (filters.subsystemname && item.subSystemName.toLowerCase() !== filters.subsystemname.toLowerCase()) return false
                if (filters.area && item.area.toLowerCase() !== filters.area.toLowerCase()) return false
                return true
            })

            const sorted = [...filtered].sort((left, right) => {
                const compare = (a: string | number, b: string | number) => (a > b ? 1 : a < b ? -1 : 0)

                switch (filters.sort) {
                    case 'systemname':
                        return compare(left.systemName, right.systemName) || compare(left.outpostName, right.outpostName)
                    case 'subsystemname':
                        return compare(left.subSystemName, right.subSystemName) || compare(left.outpostName, right.outpostName)
                    case 'area':
                        return compare(left.area, right.area) || compare(left.outpostName, right.outpostName)
                    default:
                        return compare(left.outpostName, right.outpostName)
                }
            })

            if (filters.desc === 'yes') {
                sorted.reverse()
            }

            return sorted
        }, [allItems, filters])

        const apply = () => writeOutpostQuery(filters)

        const reset = () => {
            setFilters(defaultOutpostQuery)
            writeOutpostQuery(defaultOutpostQuery)
        }

        return (
            <>
                <h1 className="h1">Outposts</h1>
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
                                <label htmlFor="outpost-search">Search</label>
                                <input
                                    id="outpost-search"
                                    className="input"
                                    value={filters.q}
                                    onChange={(event) => setFilters((current) => ({ ...current, q: event.target.value }))}
                                    placeholder="system / subsystem / area"
                                />

                                <label htmlFor="outpost-system">System</label>
                                <select
                                    id="outpost-system"
                                    className="select"
                                    value={filters.systemname}
                                    onChange={(event) => setFilters((current) => ({ ...current, systemname: event.target.value, subsystemname: '', area: '' }))}
                                >
                                    <option value="">All</option>
                                    {systemOptions.map((item) => (
                                        <option key={item} value={item}>
                                            {item}
                                        </option>
                                    ))}
                                </select>

                                <label htmlFor="outpost-subsystem">Sub System</label>
                                <select
                                    id="outpost-subsystem"
                                    className="select"
                                    value={filters.subsystemname}
                                    onChange={(event) => setFilters((current) => ({ ...current, subsystemname: event.target.value, area: '' }))}
                                >
                                    <option value="">All</option>
                                    {subsystemOptions.map((item) => (
                                        <option key={item} value={item}>
                                            {item}
                                        </option>
                                    ))}
                                </select>

                                <label htmlFor="outpost-area">Area</label>
                                <select
                                    id="outpost-area"
                                    className="select"
                                    value={filters.area}
                                    onChange={(event) => setFilters((current) => ({ ...current, area: event.target.value }))}
                                >
                                    <option value="">All</option>
                                    {areaOptions.map((item) => (
                                        <option key={item} value={item}>
                                            {item}
                                        </option>
                                    ))}
                                </select>

                                <label htmlFor="outpost-sort">Sort</label>
                                <select
                                    id="outpost-sort"
                                    className="select"
                                    value={filters.sort}
                                    onChange={(event) => setFilters((current) => ({ ...current, sort: event.target.value as OutpostSortKey }))}
                                >
                                    <option value="system">System</option>
                                    <option value="subsystem">Sub System</option>
                                    <option value="area">Area</option>
                                    <option value="name">Outpost Name</option>
                                </select>

                                <label htmlFor="outpost-order">Order</label>
                                <select
                                    id="outpost-order"
                                    className="select"
                                    value={filters.desc}
                                    onChange={(event) => setFilters((current) => ({ ...current, desc: event.target.value as SortOrder }))}
                                >
                                    <option value="no">A-Z</option>
                                    <option value="yes">Z-A</option>
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
                                <span className="badge">Results: {outpostvisible.length}</span>
                                <span className="badge">Total: {allItems.length}</span>
                            </div>
                        </div>

                        <div className="panel">
                            <table className="table">
                                <thead>
                                    <tr>
                                        <th>System</th>
                                        <th>Sub System</th>
                                        <th>Area</th>
                                        <th>Outpost</th>
                                        <th>Pad sizes</th>
                                        <th>Has Cargo</th>
                                        <th>Has Repair</th>
                                        <th>Has Garage</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {outpostvisible.map((item) => (
                                        <tr key={`${item.Id}`}>
                                            <td>{item.systemName}</td>
                                            <td>{item.subSystemName}</td>
                                            <td>{item.area}</td>
                                            <td>{item.outpostName}</td>
                                            <td>{item.padSizes}</td>
                                            <td>{String(item.cargo)}</td>
                                            <td>{String(item.repair)}</td>
                                            <td>{String(item.garage)}</td>
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
