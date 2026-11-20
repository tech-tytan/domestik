import { useState, useRef, useEffect } from "react"
import { Navigate, Link, useNavigate } from "react-router-dom"
import { request } from "../utilities/request"
import { query } from "../utilities/query"
import AdminNav from "./partials/AdminNav"
import AdminHeader from "./partials/AdminHeader"
import Search from "./partials/Search"
import Pagination from "./partials/Pagination"
import Footer from "./partials/Footer"

function Locations() {
    const [data, setData] = useState({});
    const navigate = useNavigate();
    const d = useRef({});
    const ct = useRef({});
    const queries = useRef((localStorage?.last_position != undefined) ? JSON.parse(localStorage.last_position) : {});
    const filter = useRef(null);
    const state = useRef(null);
    const city_town = useRef(null);
    const status = useRef(null);
    const url = "/locations";
    const cts = data?.cities_towns;
    const authCheck = (data?.status != undefined && data.status === "failed") ? false : true;

    if (data?.locations != undefined) {
        d.current = data;
    }

    if (cts != undefined) {
        ct.current = cts;
    }

    function lastPosition(destination, e) {
        e.preventDefault();
        localStorage.setItem("last_position", JSON.stringify(queries.current));
        navigate(destination);
    }

    useEffect(() => {
        request(url + ((localStorage?.last_position != undefined) ? query(queries) : ""), setData)
            .then(() => {
                (localStorage?.last_position != undefined) ? localStorage.removeItem("last_position") : "";
            });
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
                            <span className="page-icon"><i className="bi bi-map" aria-hidden="true"></i></span>
                            <div>
                                <p className="eyebrow mb-1">Management</p>
                                <h1 className="h3 mb-1">Locations</h1>
                                <p className="text-muted mb-0">Review locations, and their status.</p>
                            </div>
                        </div>
                        <div className="heading-actions"><Link className="btn btn-primary btn-sm" to="/add_location"><i className="bi bi-plus" aria-hidden="true"></i> Add Location</Link></div>
                    </div>

                    <section className="row g-3 mt-1" aria-label="User summary">
                        <div className="col-12 col-sm-6 col-xl-4">
                            <article className="metric-card metric-primary">
                                <div className="metric-top">
                                    <span className="metric-label">Total Locations</span>
                                    <span className="metric-icon"><i className="bi bi-map" aria-hidden="true"></i></span>
                                </div>
                                <div className="metric-value">{(Object.keys(d.current).length > 0) ? d.current.locations_count : ""}</div>
                            </article>
                        </div>

                        <div className="col-12 col-sm-6 col-xl-4">
                            <article className="metric-card metric-success">
                                <div className="metric-top">
                                    <span className="metric-label">Enabled</span>
                                    <span className="metric-icon"><i className="bi bi-check2-circle" aria-hidden="true"></i></span>
                                </div>
                                <div className="metric-value">{(Object.keys(d.current).length > 0) ? d.current.locations_enabled_count : ""}</div>
                            </article>
                        </div>

                        <div className="col-12 col-sm-6 col-xl-4">
                            <article className="metric-card metric-danger">
                                <div className="metric-top">
                                    <span className="metric-label">Disabled</span>
                                    <span className="metric-icon"><i className="bi bi-slash-circle" aria-hidden="true"></i></span>
                                </div>
                                <div className="metric-value">{(Object.keys(d.current).length > 0) ? d.current.locations_disabled_count : ""}</div>
                            </article>
                        </div>
                    </section>

                    <section className="panel mt-3">
                        <div className="panel-header">
                            <div>
                                <h2 className="h5 mb-1 section-title"><i className="bi bi-table" aria-hidden="true"></i><span>Location List</span></h2>
                                <p className="text-muted mb-0">Search, review, and manage locations.</p>
                            </div>
                            <div className="d-flex flex-wrap gap-2">
                                <Search refs={{ sort: "", filter }} queries={queries} url={url} setData={setData} />
                                <form ref={filter} onSubmit={e => e.preventDefault()}>
                                    <select ref={state} className="form-select" onChange={e => {
                                        request(url + "?region_filter=" + e.target.value, setData);
                                    }}>
                                        <option value="null">State</option>
                                        {(Object.keys(d.current).length > 0) ? d.current.regions.map((item, index) => <option key={item.index} value={item.index}>{item.region}</option>) : ""}
                                    </select>
                                    <select ref={city_town} className="form-select">
                                        <option value="">City/Town</option>
                                        {(Object.keys(ct.current).length > 0) ? ct.current.map((item, index) => <option key={item.index} value={item.index}>{item.city_town}</option>) : ""}
                                    </select>
                                    <select ref={status} className="form-select">
                                        <option value="">Status</option>
                                        <option value="enabled">Enabled</option>
                                        <option value="disabled">Disabled</option>
                                    </select>
                                    <div className="text-end mt-2">
                                        <button type="submit" className="btn btn-primary btn-sm" onClick={() => {
                                            queries.current.page = 1;
                                            queries.current.region = state.current.value;
                                            queries.current.city_town = city_town.current.value;
                                            queries.current.status = status.current.value;
                                            request(url + query(queries), setData);
                                        }}>Filter</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div className="table-responsive">
                            <table className="table align-middle mb-0" id="usersTable" data-searchable-table>
                                <thead><tr><th scope="col">Location</th><th scope="col">Status</th><th scope="col" className="text-end">Action</th></tr></thead>
                                <tbody>
                                    {(d.current.locations?.data != undefined && d.current.locations.data.length > 0) ? d.current.locations.data.map((item, index) => <tr key={item.index}>
                                        <td>
                                            <div className="d-flex align-items-center gap-2">
                                                <div>
                                                    <p className="fw-semibold mb-0">{item.location}</p>
                                                    <p className="text-muted small mb-0">{`${item.city_town}, ${item.region} State`}</p>
                                                </div>
                                            </div>
                                        </td>
                                        <td>{(item.state === "enabled") ? <span className="badge text-bg-success">{item.state}</span> : <span className="badge text-bg-danger">{item.state}</span>}</td>
                                        <td className="text-end"><a className="btn btn-light btn-sm" data-id={item.index} href="#" onClick={e => {
                                            lastPosition(`/edit_location/${e.target.dataset.id}`, e);
                                        }}>Edit</a></td>
                                    </tr>) : <tr>
                                        <td colSpan="3" className="text-center">No record yet.</td>
                                    </tr>}
                                </tbody>
                            </table>
                        </div>
                        <Pagination data={d.current?.locations} total={d.current?.locations_count} url={url} queries={queries} setData={setData} />
                    </section>
                </div>
            </main>
            <Footer />
        </div>
    </>)
}

export default Locations
