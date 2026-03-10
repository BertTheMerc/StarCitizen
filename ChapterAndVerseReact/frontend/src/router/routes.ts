// src/router/routes.ts
export type RoutePath = '/' | '/claim-timers' | '/outposts' | '/lootables' | '/components'

export const routes: Array<{ path: RoutePath; label: string }> = [
    { path: '/', label: 'Home' },
    { path: '/claim-timers', label: 'Claim Timers' },
    { path: '/outposts', label: 'Outposts' },
    { path: '/lootables', label: 'Lootables' },
    { path: '/components', label: 'Components' },
]

const routeSet = new Set(routes.map((r) => r.path))
export const isRoute = (path: string): path is RoutePath => routeSet.has(path as RoutePath)

export const getRouteFromLocation = (): RoutePath => {
    const pathname = window.location.pathname
    return isRoute(pathname) ? pathname : '/'
}