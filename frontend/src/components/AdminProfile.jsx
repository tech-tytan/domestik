import { useState, useRef, useEffect } from "react"
import { Navigate } from "react-router-dom"
import { request } from "../utilities/request"
import { showError } from "../utilities/clear"
import { money_format } from "../utilities/currency"
import AdminNav from "./partials/AdminNav"
import AdminHeader from "./partials/AdminHeader"
import ChangePassword from "./partials/ChangePassword"
import CurrentPassword from "./partials/CurrentPassword"
import Footer from "./partials/Footer"

function AdminProfile() {
    const [data, setData] = useState({});
    const d = useRef({});
    const forms = useRef(null);
    const [showPassword, setShowPassword] = useState("");
    const details = useRef(null);
    const first_name = useRef(null);
    const last_name = useRef(null);
    const email = useRef(null);
    const phone = useRef(null);
    const setting = useRef(null);
    const fee = useRef(null);
    const current_password = useRef(null);
    const id1 = "details";
    const id2 = "setting";
    const url = "/admin_profile";
    const authCheck = (data?.status != undefined && data.status === "failed") ? false : true;
    const check = (Object.keys(d.current).length > 0) ? true : false;

    function setValues(data) {
        const administrator = data?.administrator;
        if (administrator != undefined) {
            d.current = data;
            first_name.current.value = administrator.first_name;
            last_name.current.value = administrator.last_name;
            email.current.value = administrator.email_address;
            phone.current.value = administrator.phone_number;
            fee.current.value = data.fee;
        }
        setData(data);
    }

    function execute(id, form, e, set, current_password = "") {
        if (showPassword != id) {
            setShowPassword(id);
        }
        else {
            const formdata = new FormData(form.current, e.target);
            if (id === "details" || id === "setting") {
                current_password.current.value = "";
            }
            else {
                form.current.reset();
            }
            request(url, set, "post", formdata, e)
                .then(data => {
                    if (data?.errors === undefined) {
                        setShowPassword("");
                        if (id === "password") {
                            alert("Password successfully changed.");
                        }
                    }
                    else {
                        showError(forms);
                    }
                });
        }
    }

    useEffect(() => {
        request(url, setValues);
    }, []);

    return (<>
        {(!authCheck) ? <Navigate to="/admin_signin" /> : ""}
        <AdminNav />
        <div className="admin-main">
            <AdminHeader da={data} />
            <main ref={forms} className="dashboard-content">
                <div className="container-fluid px-3 px-lg-4 py-4">
                    <div className="page-heading">
                        <div className="page-heading-copy">
                            <span className="page-icon"><i className="bi bi-person-badge" aria-hidden="true"></i></span>
                            <div>
                                <p className="eyebrow mb-1">Account & Setting</p>
                                <h1 className="h3 mb-1">Profile</h1>
                                <p className="text-muted mb-0">Manage your details, fee, and password.</p>
                            </div>
                        </div>

                    </div>

                    <section className="row g-3">
                        <div className="col-12 col-xl-4">
                            <div className="panel h-100 text-center profile-card">
                                <h2 className="h5 mt-3 mb-1">{(check) ? `${d.current.administrator.first_name} ${d.current.administrator.last_name}` : ""}</h2>
                                <div className="d-flex justify-content-center gap-2"><span className="badge text-bg-primary">Admin</span></div>
                                <div className="info-list mt-4 text-start">
                                    <div>
                                        <span>Email</span><strong>{(check) ? d.current.administrator.email_address : ""}</strong>
                                    </div>
                                    <div>
                                        <span>Phone</span><strong>{(check) ? d.current.administrator.phone_number : ""}</strong>
                                    </div>
                                    <div>
                                        <span>Fee</span><strong>{(check) ? `NGN ${money_format(d.current.fee)}` : ""}</strong>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div className="col-12 col-xl-8">
                            <form className="panel" ref={details} onSubmit={e => e.preventDefault()}>
                                <div className="panel-header"><div><h2 className="h5 mb-1 section-title"><i className="bi bi-person-gear" aria-hidden="true"></i><span>Details</span></h2><p className="text-muted mb-0">Update your details.</p></div></div>
                                <div className="row g-3">
                                    <div className="col-md-6">
                                        <label className="form-label" htmlFor="first_name">First Name</label>
                                        <input ref={first_name} className="form-control" id="first_name" name="first_name" type="text" />
                                        <div className="text-danger">{(data?.errors?.first_name != undefined) ? data.errors.first_name[0] : ""}</div>
                                    </div>
                                    <div className="col-md-6">
                                        <label className="form-label" htmlFor="last_name">Last Name</label>
                                        <input ref={last_name} className="form-control" id="last_name" name="last_name" type="text" />
                                        <div className="text-danger">{(data?.errors?.last_name != undefined) ? data.errors.last_name[0] : ""}</div>
                                    </div>
                                    <div className="col-md-6">
                                        <label className="form-label" htmlFor="email">Email Address</label>
                                        <input ref={email} className="form-control" id="email" name="email" type="email" />
                                        <div className="text-danger">{(data?.errors?.email != undefined) ? data.errors.email[0] : ""}</div>
                                    </div>
                                    <div className="col-md-6">
                                        <label className="form-label" htmlFor="phone">Phone Number</label>
                                        <input ref={phone} className="form-control" id="phone" name="phone" type="text" />
                                        <div className="text-danger">{(data?.errors?.phone != undefined) ? data.errors.phone[0] : ""}</div>
                                    </div>
                                    {(showPassword === id1) ? <CurrentPassword current_password={current_password} error={data?.errors?.current_password} /> : ""}
                                </div>
                                <div className="d-flex justify-content-end mt-4">
                                    <button className="btn btn-primary" type="submit" name="update" value="Update" onClick={e => {
                                        execute(id1, details, e, setValues, current_password);
                                    }}><i className="bi bi-check2-circle" aria-hidden="true"></i> Update</button>
                                </div>
                            </form>
                            <form className="panel" ref={setting} onSubmit={e => e.preventDefault()}>
                                <div className="panel-header"><div><h2 className="h5 mb-1 section-title"><i className="bi bi-gear" aria-hidden="true"></i><span>Setting</span></h2><p className="text-muted mb-0">Update your setting.</p></div></div>
                                <div className="row g-3">
                                    <div className="col-md-6">
                                        <label className="form-label" htmlFor="fee">Monthly Fee(NGN)</label>
                                        <input ref={fee} className="form-control" id="fee" name="fee" type="text" />
                                        <div className="text-danger">{(data?.errors?.fee != undefined) ? data.errors.fee[0] : ""}</div>
                                    </div>
                                    {(showPassword === id2) ? <CurrentPassword current_password={current_password} error={data?.errors?.current_password} /> : ""}
                                </div>
                                <div className="d-flex justify-content-end mt-4">
                                    <button className="btn btn-primary" type="submit" name="set" value="Set" onClick={e => {
                                        execute(id2, setting, e, setValues, current_password);
                                    }}><i className="bi bi-check2-circle" aria-hidden="true"></i> Set</button>
                                </div>
                            </form>
                            <ChangePassword data={data} setData={setData} showPassword={showPassword} current_password={current_password} execute={execute} />
                        </div>
                    </section>
                </div>
            </main>
            <Footer />
        </div>
    </>)
}

export default AdminProfile
