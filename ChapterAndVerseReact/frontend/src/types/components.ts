import { type SortOrder } from './shared'

export type ComponentsSortKey = 'categoryname' | 'componentname' | 'manufacturecode' | 'sizeofcomponent' | 'class' | 'grade'

export interface ComponentItem {
    Id: number
    categoryName: string
    componentName: string
    manufacturerName: string
    manufacturerCode: string
    sizeOfComponent: string
    class: string
    grade: string
    weaponType: string
    price: number
    scuSize: number
    cargoSaleValue: number
    return: number
}

export interface ComponentQuery {
    q: string
    categoryName: string
    manufactureCode: string
    sizeOfComponent: string
    class: string
    grade: string
    sort: ComponentsSortKey
    desc: SortOrder
}

export const defaultComponentQuery: ComponentQuery = {
    q: '',
    categoryName: '',
    manufactureCode: '',
    sizeOfComponent: '',
    class: '',
    grade: '',
    sort: 'componentname',
    desc: 'no',
}