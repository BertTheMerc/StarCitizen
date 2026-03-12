import { type ComponentQuery, type ComponentsSortKey } from '../types/components'
import { type SortOrder } from '../types/shared'


const isComponentSortKey = (value: string | null): value is ComponentsSortKey =>
    value === 'categoryname' || value === 'componentname' || value === 'manufacturecode' || value === 'sizeofcomponent' || value === 'class' || value === 'grade'

const isSortOrder = (value: string | null): value is SortOrder => value === 'no' || value === 'yes'

export const readComponentQuery = (): ComponentQuery => {
    const params = new URLSearchParams(window.location.search)
    const sortParam = params.get('sort')
    const descParam = params.get('desc')

    return {
        q: params.get('q') ?? '',
        categoryName: params.get('categoryname') ?? '',
        manufactureCode: params.get('manufacturecode') ?? '',
        sizeOfComponent: params.get('sizeofcomponent') ?? '',
        class: params.get('class') ?? '',
        grade: params.get('grade') ?? '',
        sort: isComponentSortKey(sortParam) ? sortParam : 'componentname',
        desc: isSortOrder(descParam) ? descParam : 'no',
    }
}

export const writeComponentQuery = (query: ComponentQuery) => {
    const params = new URLSearchParams()
    if (query.q.trim()) params.set('q', query.q.trim())
    if (query.categoryName.trim()) params.set('categoryName', query.categoryName.trim())
    if (query.manufactureCode) params.set('manufacturecode', query.manufactureCode)
    if (query.sizeOfComponent) params.set('sizeofcomponent', String(query.sizeOfComponent))
    if (query.class) params.set('class', query.class)
    if (query.grade) params.set('grade', query.grade)
    params.set('sort', query.sort)
    params.set('desc', query.desc)

    const queryString = params.toString()
    window.history.replaceState({}, '', queryString ? `/Components?${queryString}` : '/Components')
}