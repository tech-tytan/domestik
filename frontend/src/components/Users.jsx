import { useState, useRef, useEffect } from "react"
import { Navigate } from "react-router-dom"
import { request } from "../utilities/request"
import { query } from "../utilities/query"
import AdminNav from "./partials/AdminNav"
import AdminHeader from "./partials/AdminHeader"
import Search from "./partials/Search"
import Pagination from "./partials/Pagination"
import Footer from "./partials/Footer"

function Users() {
    const [data, setData] = useState({});
    const d = useRef({});
    const queries = useRef({});
    const filter = useRef(null);
    const location = useRef(null);
    const status = useRef(null);
    const url = "/users";
    const authCheck = (data?.status != undefined && data.status === "failed") ? false : true;

    if (data?.users != undefined) {
        d.current = data;
    }

    function execute(name, value, e) {
        const formdata = new FormData();
        formdata.set("id", e.target.dataset.id);
        formdata.set(name, value);
        request(url + query(queries), setData, "post", formdata);
    }

    useEffect(() => {
        request(url, setData);
    }, []);

    return (<>
        {(!authCheck) ? <Navigate to="/admin_signin" /> : ""}
        <AdminNav />
        <div className="admin-main">
            <AdminHeader da={data} />
            <main className="dashboard-content">
                <div className="container-fluid px-3 px-lg-4 py-4">
                    <div className="page-heading">
                        <div className="page-heading-copy">
                            <span className="page-icon"><i className="bi bi-people" aria-hidden="true"></i></span>
                            <div>
                                <p className="eyebrow mb-1">Management</p>
                                <h1 className="h3 mb-1">Users</h1>
                                <p className="text-muted mb-0">Review users, and their status.</p>
                            </div>
                        </div>
                    </div>

                    <section className="row g-3 mt-1" aria-label="User summary">
                        <div className="col-12 col-sm-6 col-xl-4">
                            <article className="metric-card metric-primary">
                                <div className="metric-top">
                                    <span className="metric-label">Total Users</span>
                                    <span className="metric-icon"><i className="bi bi-people" aria-hidden="true"></i></span>
                                </div>
                                <div className="metric-value">{(Object.keys(d.current).length > 0) ? d.current.users_count : ""}</div>
                            </article>
                        </div>

                        <div className="col-12 col-sm-6 col-xl-4">
                            <article className="metric-card metric-success">
                                <div className="metric-top">
                                    <span className="metric-label">Activated</span>
                                    <span className="metric-icon"><i className="bi bi-check2-circle" aria-hidden="true"></i></span>
                                </div>
                                <div className="metric-value">{(Object.keys(d.current).length > 0) ? d.current.users_enabled_count : ""}</div>
                            </article>
                        </div>

                        <div className="col-12 col-sm-6 col-xl-4">
                            <article className="metric-card metric-danger">
                                <div className="metric-top">
                                    <span className="metric-label">Deactivated</span>
                                    <span className="metric-icon"><i className="bi bi-slash-circle" aria-hidden="true"></i></span>
                                </div>
                                <div className="metric-value">{(Object.keys(d.current).length > 0) ? d.current.users_disabled_count : ""}</div>
                            </article>
                        </div>
                    </section>

                    <section className="panel mt-3">
                        <div className="panel-header">
                            <div>
                                <h2 className="h5 mb-1 section-title"><i className="bi bi-table" aria-hidden="true"></i><span>User List</span></h2>
                                <p className="text-muted mb-0">Search, review, and manage users.</p>
                            </div>
                            <div className="d-flex flex-wrap gap-2">
                                <Search refs={{ sort: "", filter }} queries={queries} url={url} setData={setData} />
                                <form ref={filter} onSubmit={e => e.preventDefault()}>
                                    <select ref={location} className="form-select">
                                        <option value="">Location</option>
                                        {(Object.keys(d.current).length > 0) ? d.current.locations.map((item, index) => <option key={item.index} value={item.index}>{item.location}</option>) : ""}
                                    </select>
                                    <select ref={status} className="form-select">
                                        <option value="">Status</option>
                                        <option value="activated">Activated</option>
                                        <option value="deactivated">Deactivated</option>
                                    </select>
                                    <div className="text-end mt-2">
                                        <button type="submit" className="btn btn-primary btn-sm" onClick={() => {
                                            queries.current.page = 1;
                                            queries.current.location = location.current.value;
                                            queries.current.status = status.current.value;
                                            request(url + query(queries), setData);
                                        }}>Filter</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div className="table-responsive">
                            <table className="table align-middle mb-0" id="usersTable" data-searchable-table>
                                <thead><tr><th scope="col">User</th><th scope="col">Location</th><th scope="col">Status</th><th scope="col" className="text-end">Action</th></tr></thead>
                                <tbody>
                                    {(d.current.users?.data != undefined && d.current.users.data.length > 0) ? d.current.users.data.map((item, index) => <tr key={item.index}>
                                        <td>
                                            <div className="d-flex align-items-center gap-2">
                                                <div>
                                                    <p className="fw-semibold mb-0">{`${item.first_name} ${item.last_name}`}</p>
                                                    <p className="text-muted small mb-0">{`${item.email_address}, ${item.phone_number}`}</p>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <div className="d-flex align-items-center gap-2">
                                                <div>
                                                    <p className="fw-semibold mb-0">{`${item.home_address}, ${item.location}`}</p>
                                                    <p className="text-muted small mb-0">{`${item.city_town}, ${item.region} State`}</p>
                                                </div>
                                            </div>
                                        </td>
                                        <td>{(item.state === "activated") ? <span className="badge text-bg-success">{item.state}</span> : <span className="badge text-bg-danger">{item.state}</span>}</td>
                                        <td className="text-end">
                                            {(item.state === "deactivated") ? <button className="btn btn-success" type="submit" data-id={item.index} onClick={e => {
                                                execute("activate", "Activate", e);
                                            }}><i className="bi bi-check2-circle" aria-hidden="true"></i> Activate</button> : <button className="btn btn-danger" type="submit" data-id={item.index} onClick={e => {
                                                execute("deactivate", "Deactivate", e);
                                            }}><i className="bi bi-slash-circle" aria-hidden="true"></i> Deactivate</button>}
                                        </td>
                                    </tr>) : <tr>
                                        <td colSpan="4" className="text-center">No record yet.</td>
                                    </tr>}
                                </tbody>
                            </table>
                        </div>
                        <Pagination data={d.current?.users} total={d.current?.users_count} url={url} queries={queries} setData={setData} />
                    </section>
                </div>
            </main>
            <Footer />
        </div>
    </>)
}

export default Users
