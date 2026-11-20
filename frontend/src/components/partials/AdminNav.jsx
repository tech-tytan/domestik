import { Link, Outlet } from 'react-router-dom'

function AdminNav() {
  return (<>
    <aside className="admin-sidebar" id="adminSidebar" aria-label="Main navigation">
      <div className="sidebar-header">
        <Link className="brand-mark" to="/dashboard" aria-label="adminHMD dashboard">
          <span className="brand-icon"><i className="bi bi-leaf" aria-hidden="true"></i></span>
          <span className="brand-copy">
            <span className="brand-title">Domestik</span>
          </span>
        </Link>
      </div>

      <nav className="sidebar-nav">
        <Link className="nav-link" to="/dashboard" aria-current="page">
          <span className="nav-icon"><i className="bi bi-speedometer2" aria-hidden="true"></i></span>
          <span className="nav-text">Dashboard</span>
        </Link>
        <Link className="nav-link" to="/users">
          <span className="nav-icon"><i className="bi bi-people" aria-hidden="true"></i></span>
          <span className="nav-text">Users</span>
        </Link>
        <Link className="nav-link" to="/locations">
          <span className="nav-icon"><i className="bi bi-map" aria-hidden="true"></i></span>
          <span className="nav-text">Locations</span>
        </Link>
      </nav>
    </aside>
    <Outlet />
  </>)
}

export default AdminNav
