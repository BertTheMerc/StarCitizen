import { type SortOrder } from './shared'

export type ComponentsSortKey = 'categoryname' | 'componentname' | 'manufacturecode' | 'size' | 'class' | 'grade'

export interface ComponentItem {
    Id: number
    categoryName: string
    componentName: string
    manufactureCode: string
    size: number
    class: string
    grade: string
    scuSize: number
    cargoSaleValue: number
    return: number
}

export interface ComponentQuery {
    q: string
    categoryName: string
    componentName: string
    manufactureCode: string
    size: number
    class: string
    grade: string
    sort: ComponentsSortKey
    desc: SortOrder
}

export const defaultComponentQuery: ComponentQuery = {
    q: '',
    categoryName: '',
    componentName: '',
    manufactureCode: '',
    size: -1,
    class: '',
    grade: '',
    sort: 'componentname',
    desc: 'no',
}