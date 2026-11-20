function Footer() {
    const date = new Date();

    return (<footer className="admin-footer">
        <div className="container-fluid px-3 px-lg-4">
            <span>&copy; Copyright {date.getFullYear()} Domestik.</span>
        </div>
    </footer>)
}

export default Footer
