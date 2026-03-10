//import { Component, type MouseEvent } from 'react'
import { type MouseEvent } from 'react'
import './App.css'

import { routes, type RoutePath } from './router/routes'
import { useRoute } from './router/useRoute'

import HomePage from './pages/HomePage'
import PlaceholderPage from './pages/PlaceholderPage'
import LootablesPage from './pages/LootablesPage'
import OutpostsPage from './pages/OutpostsPage'
import ComponentsPage from './pages/ComponentsPage'

export default function App() {
    const { route, navigate } = useRoute()

    const handleNavClick = (event: MouseEvent<HTMLAnchorElement>, path: RoutePath) => {
        if (event.metaKey || event.ctrlKey || event.shiftKey || event.altKey || event.button !== 0) return
        event.preventDefault()
        navigate(path)
    }

    return (
        <div className="app-container">
            <div className="container">
                <div className="shell">
                    <header className="topbar">
                        <div className="brand">
                            <div className="flex">
                                <div className="logo">
                                    <img src="/public/images/CNV-Logo.png" />
                                </div>
                                <div className="HeaderRight">
                                    <div className="brand-title">Chapter N&apos; Verse</div>
                                    <div className="brand-sub">Star Citizen companion dashboard</div>
                                </div>
                            </div>
                        </div>
                    </header>

                    <nav className="nav" aria-label="Primary">
                        {routes.map((item) => (
                            <a
                                key={item.path}
                                href={item.path}
                                className={`nav-item ${route === item.path ? 'active' : ''}`}
                                onClick={(e) => handleNavClick(e, item.path)}
                            >
                                {item.label}
                            </a>
                        ))}
                    </nav>

                    <main className="content">
                        {route === '/' && <HomePage />}
                        {route === '/claim-timers' && <PlaceholderPage title="Claim Timers" />}
                        {route === '/outposts' && <OutpostsPage />}
                        {route === '/components' && <ComponentsPage />}
                        {route === '/lootables' && <LootablesPage />}
                    </main>
                </div>
            </div>
        </div>
    )
}