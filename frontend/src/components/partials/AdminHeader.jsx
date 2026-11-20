import { useState, useEffect, useRef } from 'react'
import { request } from '../../utilities/request'
import { Link, Outlet, useNavigate } from 'react-router-dom'

function AdminHeader({ da }) {
    const [data, setData] = useState({});
    const navigate = useNavigate();
    const d = useRef({});
    const url = "/admin_header";

    if (data?.transactions != undefined && data?.first_name != undefined) {
        d.current = data;
    }

    useEffect(() => {
        request(url, setData);
    }, [da]);

    return (<>
        <nav className="navbar admin-navbar navbar-expand bg-white">
            <div className="container-fluid px-3 px-lg-4">
                <button className="sidebar-toggle" type="button" data-sidebar-toggle aria-controls="adminSidebar" aria-expanded="true" aria-label="Toggle sidebar">
                    <span></span>
                    <span></span>
                    <span></span>
                </button>

                <div className="navbar-actions ms-auto">
                    <button className="icon-button theme-toggle" type="button" data-theme-toggle aria-label="Switch color theme" title="Switch color theme">
                        <i className="bi bi-moon-stars" data-theme-icon aria-hidden="true"></i>
                    </button>
                    <div className="dropdown">
                        <button className="icon-button" type="button" aria-expanded="false" aria-label="Notifications" onClick={() => {
                            navigate("/transactions");
                        }}>
                            {(d.current.transactions > 0) ? <span className="notification-dot"></span> : ""}
                            <i className="bi bi-credit-card" aria-hidden="true"></i>
                        </button>
                    </div>

                    <div className="dropdown">
                        <button className="profile-button dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                            <img className="avatar-img avatar-sm" src="/assets/images/avatar/avatar.jpg" alt="Avatar" />
                            <span className="d-none d-sm-inline profile-name">{d.current.first_name}</span>
                        </button>
                        <ul className="dropdown-menu dropdown-menu-end">
                            <li><Link className="dropdown-item" to="/profile">Profile & Setting</Link></li>
                            <li><hr className="dropdown-divider" /></li>
                            <li><a className="dropdown-item" href="#" onClick={e => {
                                e.preventDefault();
                                request("/admin_signout", setData)
                                    .then(data => {
                                        if (data?.status === "success") {
                                            navigate("/admin_signin");
                                        }
                                    });
                            }}>Sign out</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </nav>
        <Outlet />
    </>)
}

export default AdminHeader
