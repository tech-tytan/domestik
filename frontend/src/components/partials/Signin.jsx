import { useState, useRef, useEffect } from "react"
import { Link, useNavigate } from "react-router-dom"
import { request } from "../../utilities/request"
import AuthHeader from "./AuthHeader"

function Signin({ url, forgot_url, destination }) {
    const [data, setData] = useState({});
    const navigate = useNavigate();
    const signin = useRef(null);
    const password = useRef(null);

    useEffect(() => {
        request("/sanctum/csrf-cookie", setData);
    }, []);

    return (<>
        <AuthHeader />
        <main className="auth-page">
            <section className="auth-card">
                <form ref={signin} onSubmit={e => e.preventDefault()}>
                    <div className="mb-4">
                        <p className="eyebrow mb-1">Secure Access</p>
                        <h1 className="h3 mb-1">Signin</h1>
                        <p className="text-muted mb-0">Sign in to your portal.</p>
                    </div>
                    <div className="mb-3">
                        <label className="form-label" htmlFor="email_or_phone">Email address or Phone number</label>
                        <input className="form-control" id="email_or_phone" name="email_or_phone" type="email" />
                        <div className="text-danger">{(data?.errors?.email_or_phone != undefined) ? data.errors.email_or_phone[0] : ""}</div>
                    </div>
                    <div className="mb-3">
                        <div className="d-flex justify-content-between">
                            <label className="form-label" htmlFor="password">Password</label>
                            <Link className="small fw-semibold" to={forgot_url}>Forgot?</Link>
                        </div>
                        <input ref={password} className="form-control" id="password" name="password" type="password" />
                        <div className="text-danger">{(data?.errors?.password != undefined) ? data.errors.password[0] : ""}</div>
                    </div>
                    <button className="btn btn-primary w-100" type="submit" name="signin" value="Signin" onClick={e => {
                        const formdata = new FormData(signin.current, e.target);
                        password.current.value = "";
                        request(url, setData, "post", formdata, e)
                            .then(data => {
                                if (data?.error != undefined) {
                                    alert(data.error);
                                }
                                if (data?.status === "success") {
                                    signin.current.reset();
                                    navigate(destination);
                                }
                            });
                    }}><i className="bi bi-box-arrow-in-right" aria-hidden="true"></i> Sign In</button>
                </form>

                {(url === "/user_signin") ? <div className="auth-footer">New here? <Link to="/register">Create an account</Link></div> : ""}
            </section>
        </main>
    </>)
}

export default Signin
