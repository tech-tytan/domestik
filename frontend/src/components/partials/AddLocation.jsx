import { useState, useRef, useEffect } from "react"
import { Link, Navigate, useNavigate } from "react-router-dom"
import { request } from "../../utilities/request"
import AdminNav from "./AdminNav"
import AdminHeader from "./AdminHeader"
import Footer from "./Footer"

function AddLocation() {
    const [data, setData] = useState({});
    const navigate = useNavigate();
    const d = useRef({});
    const ct = useRef({});
    const add = useRef(null);
    const url = "/locations";
    const cts = data?.cities_towns;
    const authCheck = (data?.status != undefined && data.status === "failed") ? false : true;

    if (data?.locations != undefined) {
        d.current = data;
    }

    if (cts != undefined) {
        ct.current = cts;
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
                            <span className="page-icon"><i className="bi bi-map" aria-hidden="true"></i></span>
                            <div>
                                <p className="eyebrow mb-1">Management</p>
                                <h1 className="h3 mb-1">Add Location</h1>
                                <p className="text-muted mb-0">Create a new location.</p>
                            </div>
                        </div>
                        <div className="heading-actions"><Link className="btn btn-outline-secondary btn-sm" to="/locations"><i className="bi bi-arrow-left" aria-hidden="true"></i> Back to Locations</Link></div>
                    </div>

                    <section className="row g-3">
                        <div className="col-12 col-xl-8">
                            <form className="panel" ref={add} onSubmit={e => e.preventDefault()}>
                                <div className="panel-header"><div><h2 className="h5 mb-1 section-title"><i className="bi bi-map" aria-hidden="true"></i><span>Location Information</span></h2><p className="text-muted mb-0">Create a location.</p></div></div>
                                <div className="row g-3">
                                    <div className="col-md-6">
                                        <label className="form-label" htmlFor="name">Name</label>
                                        <input className="form-control" id="name" name="name" type="text" />
                                        <div className="text-danger">{(data?.errors?.name != undefined) ? data.errors.name[0] : ""}</div>
                                    </div>
                                    <div className="col-md-6">
                                        <label className="form-label" htmlFor="state">State</label>
                                        <select className="form-select" id="state" name="state" onChange={e => {
                                            request(url + "?region_filter=" + e.target.value, setData);
                                        }}>
                                            <option value="">Select</option>
                                            {(Object.keys(d.current).length > 0) ? d.current.regions.map((item, index) => <option key={item.index} value={item.index}>{item.region}</option>) : ""}
                                        </select>
                                        <div className="text-danger">{(data?.errors?.state != undefined) ? data.errors.state[0] : ""}</div>
                                    </div>
                                    <div className="col-md-6">
                                        <label className="form-label" htmlFor="city_or_town">City/Town</label>
                                        <select className="form-select" id="city_or_town" name="city_or_town">
                                            <option value="">Select</option>
                                            {(Object.keys(ct.current).length > 0) ? ct.current.map((item, index) => <option key={item.index} value={item.index}>{item.city_town}</option>) : ""}
                                        </select>
                                        <div className="text-danger">{(data?.errors?.city_or_town != undefined) ? data.errors.city_or_town[0] : ""}</div>
                                    </div>
                                </div>
                                <div className="d-flex flex-wrap justify-content-end gap-2 mt-4">
                                    <Link className="btn btn-outline-secondary" to="/locations">Cancel</Link>
                                    <button className="btn btn-primary" type="submit" name="add" value="Add" onClick={e => {
                                        const formdata = new FormData(add.current, e.target);
                                        request(url, setData, "post", formdata, e)
                                            .then(data => {
                                                if (data?.errors === undefined) {
                                                    add.current.reset();
                                                    navigate("/locations");
                                                }
                                            });
                                    }}><i className="bi bi-plus" aria-hidden="true"></i> Create Location</button>
                                </div>
                            </form>
                        </div>
                    </section>
                </div>
            </main>
            <Footer />
        </div>
    </>)
}

export default AddLocation
