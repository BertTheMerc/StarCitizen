import { type LootQuery, type LootableSortKey } from '../types/loot'
import { type SortOrder } from '../types/shared'


const isLootSortKey = (value: string | null): value is LootableSortKey =>
    value === 'itemtype' || value === 'subitemtype' || value === 'return' || value === 'name' || value === 'sell' || value === 'size'

const isSortOrder = (value: string | null): value is SortOrder => value === 'no' || value === 'yes'

export const readLootQuery = (): LootQuery => {
    const params = new URLSearchParams(window.location.search)
    const sortParam = params.get('sort')
    const descParam = params.get('desc')

    return {
        q: params.get('q') ?? '',
        type: params.get('type') ?? '',
        sub: params.get('sub') ?? '',
        sort: isLootSortKey(sortParam) ? sortParam : 'itemtype',
        desc: isSortOrder(descParam) ? descParam : 'no',
    }
}

export const writeLootQuery = (query: LootQuery) => {
    const params = new URLSearchParams()
    if (query.q.trim()) params.set('q', query.q.trim())
    if (query.type) params.set('type', query.type)
    if (query.sub) params.set('sub', query.sub)
    params.set('sort', query.sort)
    params.set('desc', query.desc)

    const queryString = params.toString()
    window.history.replaceState({}, '', queryString ? `/lootables?${queryString}` : '/lootables')
}