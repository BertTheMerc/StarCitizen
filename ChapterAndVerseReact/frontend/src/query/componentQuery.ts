import { type ComponentQuery, type ComponentsSortKey } from '../types/components'
import { type SortOrder } from '../types/shared'


const isComponentSortKey = (value: string | null): value is ComponentsSortKey =>
    value === 'categoryname' || value === 'componentname' || value === 'manufacturecode' || value === 'size' || value === 'class' || value === 'grade'

const isSortOrder = (value: string | null): value is SortOrder => value === 'no' || value === 'yes'

export const readComponentQuery = (): ComponentQuery => {
    const params = new URLSearchParams(window.location.search)
    const sortParam = params.get('sort')
    const descParam = params.get('desc')

    return {
        q: params.get('q') ?? '',
        categoryName: params.get('categoryname') ?? '',
        componentName: params.get('componentname') ?? '',
        manufactureCode: params.get('manufacturecode') ?? '',
        size: isNaN(Number(params.get('size'))) ? -1 : Number(params.get('size')),
        class: params.get('class') ?? '',
        grade: params.get('grade') ?? '',
        sort: isComponentSortKey(sortParam) ? sortParam : 'componentname',
        desc: isSortOrder(descParam) ? descParam : 'no',
    }
}

export const writeComponentQuery = (query: ComponentQuery) => {
    const params = new URLSearchParams()
    if (query.q.trim()) params.set('q', query.q.trim())
    if (query.componentName) params.set('componentname', query.componentName)
    if (query.manufactureCode) params.set('manufacturecode', query.manufactureCode)
    if (query.size) params.set('size', String(query.size))
    if (query.class) params.set('class', query.class)
    if (query.grade) params.set('grade', query.grade)
    params.set('sort', query.sort)
    params.set('desc', query.desc)

    const queryString = params.toString()
    window.history.replaceState({}, '', queryString ? `/Components?${queryString}` : '/Components')
}