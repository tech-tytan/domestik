import { useState, useRef, useEffect } from "react"
import { Navigate } from "react-router-dom"
import { request } from "../utilities/request"
import { showError } from "../utilities/clear"
import UserNav from "./partials/UserNav"
import UserHeader from "./partials/UserHeader"
import ChangePassword from "./partials/ChangePassword"
import CurrentPassword from "./partials/CurrentPassword"
import Footer from "./partials/Footer"

function UserProfile() {
    const [data, setData] = useState({});
    const d = useRef({});
    const forms = useRef(null);
    const [showPassword, setShowPassword] = useState("");
    const details = useRef(null);
    const first_name = useRef(null);
    const last_name = useRef(null);
    const email = useRef(null);
    const phone = useRef(null);
    const address = useRef(null);
    const location = useRef(null);
    const current_password = useRef(null);
    const id = "details";
    const url = "/user_profile";
    const authCheck = (data?.status != undefined && data.status === "failed") ? false : true;
    const check = (Object.keys(d.current).length > 0) ? true : false;

    function setValues(data) {
        const user = data?.user;
        if (user != undefined) {
            d.current = data;
            first_name.current.value = user.first_name;
            last_name.current.value = user.last_name;
            email.current.value = user.email_address;
            phone.current.value = user.phone_number;
            address.current.value = user.home_address;
            location.current.value = user.location_index;
        }
        setData(data);
    }

    function execute(id, form, e, set, current_password = "") {
        if (showPassword != id) {
            setShowPassword(id);
        }
        else {
            const formdata = new FormData(form.current, e.target);
            if (id === "details") {
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
    }, [data]);

    return (<>
        {(!authCheck) ? <Navigate to="/signin" /> : ""}
        <UserNav />
        <div className="admin-main">
            <UserHeader da={data} />
            <main ref={forms} className="dashboard-content">
                <div className="container-fluid px-3 px-lg-4 py-4">
                    <div className="page-heading">
                        <div className="page-heading-copy">
                            <span className="page-icon"><i className="bi bi-person-badge" aria-hidden="true"></i></span>
                            <div>
                                <p className="eyebrow mb-1">Account & Setting</p>
                                <h1 className="h3 mb-1">Profile</h1>
                                <p className="text-muted mb-0">Manage your details, and password.</p>
                            </div>
                        </div>

                    </div>

                    <section className="row g-3">
                        <div className="col-12 col-xl-4">
                            <div className="panel h-100 text-center profile-card">
                                <h2 className="h5 mt-3 mb-1">{(check) ? `${d.current.user.first_name} ${d.current.user.last_name}` : ""}</h2>
                                <div className="d-flex justify-content-center gap-2"><span className="badge text-bg-primary">User</span></div>
                                <div className="info-list mt-4 text-start">
                                    <div>
                                        <span>Email</span><strong>{(check) ? d.current.user.email_address : ""}</strong>
                                    </div>
                                    <div>
                                        <span>Phone</span><strong>{(check) ? d.current.user.phone_number : ""}</strong>
                                    </div>
                                    <div>
                                        <span>City & State</span><strong>{(check) ? `${d.current.user.city_town}, ${d.current.user.region} State` : ""}</strong>
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
                                    <div className="col-md-6">
                                        <label className="form-label" htmlFor="address">Address</label>
                                        <textarea ref={address} className="form-control" id="address" name="address"></textarea>
                                        <div className="text-danger">{(data?.errors?.address != undefined) ? data.errors.address[0] : ""}</div>
                                    </div>
                                    <div className="col-md-6">
                                        <label className="form-label" htmlFor="location">Location</label>
                                        <select ref={location} className="form-select" id="location" name="location">
                                            {(check) ? d.current.locations.map((item, index) => <option key={item.index} value={item.index}>{item.location}</option>) : ""}
                                        </select>
                                        <div className="text-danger">{(data?.errors?.location != undefined) ? data.errors.location[0] : ""}</div>
                                    </div>
                                    {(showPassword === id) ? <CurrentPassword current_password={current_password} error={data?.errors?.current_password} /> : ""}
                                </div>
                                <div className="d-flex justify-content-end mt-4">
                                    <button className="btn btn-primary" type="submit" name="update" value="Update" onClick={e => {
                                        execute(id, details, e, setValues, current_password);
                                    }}><i className="bi bi-check2-circle" aria-hidden="true"></i> Update</button>
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

export default UserProfile
