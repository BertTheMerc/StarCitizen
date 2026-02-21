import { type OutpostQuery, type OutpostSortKey } from '../types/outposts'
import { type SortOrder } from '../types/shared'


const isOutpostSortKey = (value: string | null): value is OutpostSortKey =>
    value === 'systemname' || value === 'subsystemname' || value === 'area' || value === 'outpostname'

const isSortOrder = (value: string | null): value is SortOrder => value === 'no' || value === 'yes'

export const readOutpostQuery = (): OutpostQuery => {
    const params = new URLSearchParams(window.location.search)
    const sortParam = params.get('sort')
    const descParam = params.get('desc')

    return {
        q: params.get('q') ?? '',
        systemname: params.get('systemname') ?? '',
        subsystemname: params.get('subsystemname') ?? '',
        area: params.get('area') ?? '',
        sort: isOutpostSortKey(sortParam) ? sortParam : 'systemname',
        desc: isSortOrder(descParam) ? descParam : 'no',
    }
}

export const writeOutpostQuery = (query: OutpostQuery) => {
    const params = new URLSearchParams()
    if (query.q.trim()) params.set('q', query.q.trim())
    if (query.systemname) params.set('systemname', query.systemname)
    if (query.subsystemname) params.set('subsystemname', query.subsystemname)
    if (query.area) params.set('area', query.area)
    params.set('sort', query.sort)
    params.set('desc', query.desc)

    const queryString = params.toString()
    window.history.replaceState({}, '', queryString ? `/outposts?${queryString}` : '/outposts')
}