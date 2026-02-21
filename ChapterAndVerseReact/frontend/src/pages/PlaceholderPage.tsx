export default function PlaceholderPage({ title }: { title: string }) {
    return (
        <>
            <h1 className="h1">{title}</h1>
            <p className="p">Placeholder page. Add content for this area.</p>
            <div className="panel">
                <span className="badge">Coming soon</span>
            </div>
        </>
    )
}