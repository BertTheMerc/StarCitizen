import { type SortOrder } from '../types/shared'

export type OutpostSortKey = 'systemname' | 'subsystemname' | 'area' | 'outpostname'

export interface OutpostItem {
    Id: number
    systemName: string
    subSystemName: string
    area: string
    outpostName: string
    padSizes: string
    cargo: boolean
    repair: boolean
    garage: boolean
}

export interface OutpostQuery {
    q: string
    systemname: string
    subsystemname: string
    area: string
    sort: OutpostSortKey
    desc: SortOrder
}

export const defaultOutpostQuery: OutpostQuery = {
    q: '',
    systemname: '',
    subsystemname: '',
    area: '',
    sort: 'systemname',
    desc: 'no',
}