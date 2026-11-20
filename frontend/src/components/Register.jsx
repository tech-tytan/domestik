import { useState, useRef, useEffect } from "react"
import { Link, useNavigate } from "react-router-dom"
import { request } from "../utilities/request"
import AuthHeader from "./partials/AuthHeader"

function Register() {
    const [data, setData] = useState({});
    const d = useRef({});
    const navigate = useNavigate();
    const register = useRef(null);
    const password = useRef(null);
    const url = "/register";

    if (data?.locations != undefined) {
        d.current = data;
    }

    useEffect(() => {
        request(url, setData);
    }, []);

    return (<>
        <AuthHeader />
        <main className="auth-page">
            <section className="auth-card">
                <form ref={register} onSubmit={e => e.preventDefault()}>
                    <div className="mb-4">
                        <p className="eyebrow mb-1">Secure Access</p>
                        <h1 className="h3 mb-1">Register</h1>
                        <p className="text-muted mb-0">Create your account.</p>
                    </div>
                    <div className="mb-3">
                        <label className="form-label" htmlFor="first_name">First name</label>
                        <input className="form-control" id="first_name" name="first_name" type="text" />
                        <div className="text-danger">{(data?.errors?.first_name != undefined) ? data.errors.first_name[0] : ""}</div>
                    </div>
                    <div className="mb-3">
                        <label className="form-label" htmlFor="last_name">Last name</label>
                        <input className="form-control" id="last_name" name="last_name" type="text" />
                        <div className="text-danger">{(data?.errors?.last_name != undefined) ? data.errors.last_name[0] : ""}</div>
                    </div>
                    <div className="mb-3">
                        <label className="form-label" htmlFor="email">Email address</label>
                        <input className="form-control" id="email" name="email" type="email" />
                        <div className="text-danger">{(data?.errors?.email != undefined) ? data.errors.email[0] : ""}</div>
                    </div>
                    <div className="mb-3">
                        <label className="form-label" htmlFor="phone">Phone number</label>
                        <input className="form-control" id="phone" name="phone" type="text" />
                        <div className="text-danger">{(data?.errors?.phone != undefined) ? data.errors.phone[0] : ""}</div>
                    </div>
                    <div className="mb-3">
                        <label className="form-label" htmlFor="address">Address</label>
                        <textarea className="form-control" id="address" name="address"></textarea>
                        <div className="text-danger">{(data?.errors?.address != undefined) ? data.errors.address[0] : ""}</div>
                    </div>
                    <div className="mb-3">
                        <label className="form-label">Location</label>
                        <select className="form-select" name="location">
                            <option value="">Select</option>
                            {(Object.keys(d.current).length > 0) ? d.current.locations.map((item, index) => <option key={item.index} value={item.index}>{item.location}</option>) : ""}
                        </select>
                        <div className="text-danger">{(data?.errors?.location != undefined) ? data.errors.location[0] : ""}</div>
                    </div>
                    <div className="mb-3">
                        <label className="form-label" htmlFor="password">Password</label>
                        <input ref={password} className="form-control" id="password" name="password" type="password" />
                        <div className="text-danger">{(data?.errors?.password != undefined) ? data.errors.password[0] : ""}</div>
                    </div>
                    <button className="btn btn-primary w-100" type="submit" name="register" value="Register" onClick={e => {
                        const formdata = new FormData(register.current, e.target);
                        password.current.value = "";
                        request(url, setData, "post", formdata, e)
                            .then(data => {
                                if (data?.status === "success") {
                                    register.current.reset();
                                    navigate("/signin");
                                }
                            });
                    }}><i className="bi bi-person-plus" aria-hidden="true"></i> Create Account</button>
                </form>

                <div className="auth-footer">Already have an account? <Link to="/signin">Sign in</Link></div>
            </section>
        </main>
    </>)
}

export default Register
