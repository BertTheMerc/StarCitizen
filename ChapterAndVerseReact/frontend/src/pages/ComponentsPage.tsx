import { useEffect, useMemo, useState } from 'react'
import type { ComponentItem, ComponentQuery, ComponentsSortKey } from '../types/components' 
import type { SortOrder } from '../types/shared'
import { defaultComponentQuery } from '../types/components'
import { readComponentQuery, writeComponentQuery } from '../query/componentQuery' 

export default function ComponentsPage() {
        const [allItems, setAllItems] = useState<ComponentItem[]>([])
        const [loading, setLoading] = useState(true)
        const [error, setError] = useState<string | null>(null)
        const [filters, setFilters] = useState<ComponentQuery>(readComponentQuery)

        useEffect(() => {
            const onPopState = () => setFilters(readComponentQuery())
            window.addEventListener('popstate', onPopState)

            const load = async () => {
                try {
                    setLoading(true)
                    setError(null)
                    const response = await fetch('/api/Components')
                    if (!response.ok) {
                        throw new Error(`Unable to load Component list (${response.status})`)
                    }

                    const data: ComponentItem[] = await response.json()
                    setAllItems(data)
                } catch (loadError) {
                    setError(loadError instanceof Error ? loadError.message : 'Failed to load Components')
                } finally {
                    setLoading(false)
                }
            }

            void load()

            return () => window.removeEventListener('popstate', onPopState)
        }, [])

        const categoryOptions = useMemo(
            () => [...new Set(allItems.map((item) => item.categoryName).filter(Boolean))].sort((left, right) => left.localeCompare(right)),
            [allItems],
        )

        const componentOptions = useMemo(
            () =>
                [
                    ...new Set(
                        allItems
                            .filter((item) => !filters.categoryName || item.categoryName.toLowerCase() === filters.categoryName.toLowerCase())
                            .map((item) => item.componentName)
                            .filter(Boolean),
                    ),
                ].sort((left, right) => left.localeCompare(right)),
            [allItems, filters.categoryName],
        )


        const manufactureOptions = useMemo(
        () => [...new Set(allItems.map((item) => item.manufactureCode).filter(Boolean))].sort((left, right) => left.localeCompare(right)),
        [allItems],
    )

        const componentvisible = useMemo(() => {
            const term = filters.q.trim().toLowerCase()

            const filtered = allItems.filter((item) => {
                if (term.length > 0) {
                    const haystack = `${item.categoryName} ${item.componentName} ${item.manufactureCode}`.toLowerCase()
                    if (!haystack.includes(term)) return false
                }

                if (filters.categoryName && item.categoryName.toLowerCase() !== filters.categoryName.toLowerCase()) return false
                if (filters.componentName && item.componentName.toLowerCase() !== filters.componentName.toLowerCase()) return false
                if (filters.manufactureCode && item.manufactureCode.toLowerCase() !== filters.manufactureCode.toLowerCase()) return false
                return true
            })

            const sorted = [...filtered].sort((left, right) => {
                const compare = (a: string | number, b: string | number) => (a > b ? 1 : a < b ? -1 : 0)

                switch (filters.sort) {
                    case 'categoryname':
                        return compare(left.categoryName, right.categoryName) || compare(left.categoryName, right.categoryName)
                    case 'componentname':
                        return compare(left.componentName, right.componentName) || compare(left.componentName, right.componentName)
                    case 'manufacturecode':
                        return compare(left.manufactureCode, right.manufactureCode) || compare(left.manufactureCode, right.manufactureCode)
                    default:
                        return compare(left.categoryName, right.categoryName)
                }
            })

            if (filters.desc === 'yes') {
                sorted.reverse()
            }

            return sorted
        }, [allItems, filters])

        const apply = () => writeComponentQuery(filters)

        const reset = () => {
            setFilters(defaultComponentQuery)
            writeComponentQuery(defaultComponentQuery)
        }

        return (
            <>
                <h1 className="h1">Components</h1>
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
                                <label htmlFor="component-search">Search</label>
                                <input
                                    id="component-search"
                                    className="input"
                                    value={filters.q}
                                    onChange={(event) => setFilters((current) => ({ ...current, q: event.target.value }))}
                                    placeholder="category / component / manufacture"
                                />

                                <label htmlFor="component-system">Category</label>
                                <select
                                    id="component-category"
                                    className="select"
                                    value={filters.categoryName}
                                    onChange={(event) => setFilters((current) => ({ ...current, systemname: event.target.value, subsystemname: '', area: '' }))}
                                >
                                    <option value="">All</option>
                                    {categoryOptions.map((item) => (
                                        <option key={item} value={item}>
                                            {item}
                                        </option>
                                    ))}
                                </select>

                                <label htmlFor="component-component">Component</label>
                                <select
                                    id="component-component"
                                    className="select"
                                    value={filters.componentName}
                                    onChange={(event) => setFilters((current) => ({ ...current, subsystemname: event.target.value, area: '' }))}
                                >
                                    <option value="">All</option>
                                    {componentOptions.map((item) => (
                                        <option key={item} value={item}>
                                            {item}
                                        </option>
                                    ))}
                                </select>

                                <label htmlFor="component-manufacture">Manufacture</label>
                                <select
                                    id="component-manufacture"
                                    className="select"
                                    value={filters.manufactureCode}
                                    onChange={(event) => setFilters((current) => ({ ...current, area: event.target.value }))}
                                >
                                    <option value="">All</option>
                                        {manufactureOptions.map((item) => (
                                        <option key={item} value={item}>
                                            {item}
                                        </option>
                                    ))}
                                </select>

                                <label htmlFor="component-sort">Sort</label>
                                <select
                                    id="component-sort"
                                    className="select"
                                    value={filters.sort}
                                    onChange={(event) => setFilters((current) => ({ ...current, sort: event.target.value as ComponentsSortKey }))}
                                >
                                    <option value="category">Category</option>
                                    <option value="components">Components</option>
                                    <option value="manufacture">Manufacture</option>
                                    <option value="size">Size</option>
                                </select>

                                <label htmlFor="component-order">Order</label>
                                <select
                                    id="component-order"
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
                                <span className="badge">Results: {componentvisible.length}</span>
                                <span className="badge">Total: {allItems.length}</span>
                            </div>
                        </div>

                        <div className="panel">
                            <table className="table">
                                <thead>
                                    <tr>
                                        <th>Category</th>
                                        <th>Component</th>
                                        <th>Manufacture</th>
                                        <th>Size</th>
                                        <th>Class</th>
                                        <th>Grade</th>
                                        <th>Scu Size</th>
                                        <th>Sale</th>
                                        <th>Return</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {componentvisible.map((item) => (
                                        <tr key={`${item.Id}`}>
                                            <td>{item.categoryName}</td>
                                            <td>{item.componentName}</td>
                                            <td>{item.manufactureCode}</td>
                                            <td>{String(item.size)}</td>
                                            <td>{item.class}</td>
                                            <td>{item.grade}</td>
                                            <td>{String(item.scuSize)}</td>
                                            <td>{String(item.cargoSaleValue)}</td>
                                            <td>{String(item.return)}</td>
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
