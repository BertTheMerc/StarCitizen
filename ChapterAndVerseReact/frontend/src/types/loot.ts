import { type SortOrder } from '../types/shared'

export type LootableSortKey = 'itemtype' | 'subitemtype' | 'return' | 'name' | 'sell' | 'size'

export interface LootItem {
    itemType: string
    subType: string
    itemName: string
    scuSize: number
    cargoSaleValue: number
    return: number
}

export interface LootQuery {
    q: string
    type: string
    sub: string
    sort: LootableSortKey
    desc: SortOrder
}

export const defaultLootQuery: LootQuery = {
    q: '',
    type: '',
    sub: '',
    sort: 'itemtype',
    desc: 'no',
}
