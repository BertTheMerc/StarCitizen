// src/router/useRoute.ts
import { useEffect, useState } from 'react'
import { type RoutePath, getRouteFromLocation } from './routes'

export function useRoute() {
    const [route, setRoute] = useState<RoutePath>(getRouteFromLocation)

    useEffect(() => {
        const onPopState = () => setRoute(getRouteFromLocation())
        window.addEventListener('popstate', onPopState)
        return () => window.removeEventListener('popstate', onPopState)
    }, [])

    const navigate = (path: RoutePath) => {
        if (path === route) return
        window.history.pushState({}, '', path)
        setRoute(path)
    }

    return { route, navigate }
}