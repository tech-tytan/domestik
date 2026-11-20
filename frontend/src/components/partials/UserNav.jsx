import { Link, Outlet } from 'react-router-dom'

function UserNav() {
  return (<>
    <aside className="admin-sidebar" id="adminSidebar" aria-label="Main navigation">
      <div className="sidebar-header">
        <Link className="brand-mark" to="/overview" aria-label="adminHMD dashboard">
          <span className="brand-icon"><i className="bi bi-leaf" aria-hidden="true"></i></span>
          <span className="brand-copy">
            <span className="brand-title">Domestik</span>
          </span>
        </Link>
      </div>

      <nav className="sidebar-nav">
        <Link className="nav-link" to="/overview" aria-current="page">
          <span className="nav-icon"><i className="bi bi-speedometer2" aria-hidden="true"></i></span>
          <span className="nav-text">Dashboard</span>
        </Link>
      </nav>
    </aside>
    <Outlet />
  </>)
}

export default UserNav
