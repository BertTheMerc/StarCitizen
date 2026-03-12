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

        const safeLower = (value: unknown) => String(value ?? '').toLowerCase()

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

        /*
       const sizeOptions = useMemo(
            () =>
                [
                    ...new Set(
                        allItems
                            .filter((item) => !filters.sizeOfComponent || safeLower(item.sizeOfComponent) === safeLower(filters.sizeOfComponent))
                            .map((item) => item.sizeOfComponent)
                            .filter(Boolean),
                    ),
                ].sort((left, right) => left.localeCompare(right)),
            [allItems, filters.sizeOfComponent]
        )
        */
        const classOptions = useMemo(
        () =>
            [
                ...new Set(
                    allItems
                        .filter((item) => !filters.class || safeLower(item.class) === safeLower(filters.class))
                        .map((item) => item.class)
                        .filter(Boolean),
                ),
            ].sort((left, right) => left.localeCompare(right)),
        [allItems, filters.class]
        )

        const gradeOptions = useMemo(
        () =>
            [
                ...new Set(
                    allItems
                        .filter((item) => !filters.grade || safeLower(item.grade) === safeLower(filters.grade))
                        .map((item) => item.grade)
                        .filter(Boolean),
                ),
            ].sort((left, right) => left.localeCompare(right)),
        [allItems, filters.grade]
    )

        const manufactureOptions = useMemo(
            () => [...new Set(allItems.map((item) => item.manufacturerCode).filter(Boolean))].sort((left, right) => left.localeCompare(right)),
        [allItems],
    )

        const componentvisible = useMemo(() => {
            const term = safeLower(filters.q).trim()

            const filtered = allItems.filter((item) => {
                if (term.length > 0) {
                    const haystack = safeLower(`${item.categoryName} ${item.componentName} ${item.manufacturerCode}`)
                    if (!haystack.includes(term)) return false
                }

                if (filters.categoryName && safeLower(item.categoryName) !== safeLower(filters.categoryName)) return false
                if (filters.manufactureCode && safeLower(item.manufacturerCode) !== safeLower(filters.manufactureCode)) return false
                if (filters.sizeOfComponent && safeLower(item.sizeOfComponent) !== safeLower(filters.sizeOfComponent)) return false
                return true
            })

            const sorted = [...filtered].sort((left, right) => {
                const compare = (a: string | number, b: string | number) => (a > b ? 1 : a < b ? -1 : 0)

                switch (filters.sort) {
                    case 'categoryname':
                        return compare(left.categoryName, right.categoryName)
                    case 'componentname':
                        return compare(left.componentName, right.componentName)
                    case 'manufacturecode':
                        return compare(left.manufacturerCode, right.manufacturerCode)
                    case 'sizeofcomponent':
                        return compare(left.sizeOfComponent, right.sizeOfComponent)
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

        const showCategoryColumn = !filters.categoryName

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

                                <label htmlFor="component-category">Category</label>
                                <select
                                    id="component-category"
                                    className="select"
                                    value={filters.categoryName}
                                    onChange={(event) => setFilters((current) => ({ ...current, categoryName: event.target.value, manufactureCode: '' }))}
                                >
                                    <option value="">All</option>
                                    {categoryOptions.map((item) => (
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
                                            onChange={(event) => setFilters((current) => ({ ...current, manufactureCode: event.target.value }))}
                                >
                                    <option value="">All</option>
                                        {manufactureOptions.map((item) => (
                                        <option key={item} value={item}>
                                            {item}
                                        </option>
                                    ))}
                                </select>

                                        
                                        <label htmlFor="component-class">Class</label>
                                        <select
                                            id="component-class"
                                            className="select"
                                            value={filters.class}
                                            onChange={(event) => setFilters((current) => ({ ...current, class: event.target.value }))}
                                        >
                                            <option value="">All</option>
                                            {classOptions.map((item) => (
                                                <option key={item} value={item}>
                                                    {item}
                                                </option>
                                            ))}
                                        </select>

                                        <label htmlFor="component-grade">Grade</label>
                                        <select
                                            id="component-grade"
                                            className="select"
                                            value={filters.grade}
                                            onChange={(event) => setFilters((current) => ({ ...current, grade: event.target.value}))}
                                        >
                                            <option value="">All</option>
                                            {gradeOptions.map((item) => (
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
                                        {showCategoryColumn && <th>Cat</th>}
                                        <th>Name</th>
                                        <th>Man</th>
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
                                            {showCategoryColumn && <th>{item.categoryName}</th>}
                                            <td>{item.componentName}</td>
                                            <td>{item.manufacturerCode}</td>
                                            <td>{String(item.sizeOfComponent)}</td>
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
