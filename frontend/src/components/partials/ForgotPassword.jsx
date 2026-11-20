import { useState, useRef, useEffect } from "react"
import { Link, useNavigate } from "react-router-dom"
import { request } from "../../utilities/request"
import AuthHeader from "./AuthHeader"

function ForgotPassword({ url, login_url }) {
    const [data, setData] = useState({});
    const [blocked, setBlocked] = useState(false);
    const da = useRef({});
    const navigate = useNavigate();
    const forgot = useRef(null);
    const email = useRef("");

    if (blocked) {
        setTimeout(() => {
            setBlocked(false);
        }, 60000);
    }

    if (data?.forgot != undefined || data?.verify != undefined || data?.change != undefined) {
        da.current = data;
    }

    function execute(e) {
        const formdata = new FormData(forgot.current, e.target);
        if (email.current != "") {
            forgot.current.reset();
            formdata.set("email", email.current);
        }
        request(url, setData, "post", formdata, e)
            .then(data => {
                if (data?.error != undefined) {
                    da.current = {};
                    alert(data.error);
                }
                if (data?.forgot === "passed" && data?.email != undefined) {
                    email.current = data.email;
                    setBlocked(true);
                }
                if (data?.change === "passed") {
                    navigate(login_url);
                }
            });
    }

    useEffect(() => {
        request("/sanctum/csrf-cookie", setData);
    }, []);

    return (<>
        <AuthHeader />
        <main className="auth-page">
            <section className="auth-card">
                <form ref={forgot} onSubmit={e => e.preventDefault()}>
                    <div className="mb-4">
                        <p className="eyebrow mb-1">Secure Access</p>
                        <h1 className="h3 mb-1">Forgot Password</h1>
                        <p className="text-muted mb-0">Reset your account password.</p>
                    </div>
                    {(da.current?.forgot === undefined && da.current?.verify === undefined && da.current?.change === undefined) && <>
                        <div className="mb-4">
                            <label className="form-label" htmlFor="email">Email address</label>
                            <input className="form-control" id="email" name="email" type="email" />
                            <div className="text-danger">{(data?.errors?.email != undefined) ? data.errors.email[0] : ""}</div>
                        </div>
                        <button className="btn btn-primary w-100" type="submit" name="forgot" value="Forgot" onClick={e => {
                            execute(e);
                        }}><i className="bi bi-envelope-arrow-up" aria-hidden="true"></i> Send Reset Code</button>
                        <p className="text-muted small mt-3 mb-0">Check your inbox and spam folder after submitting.</p>
                    </>}
                    {(da.current?.forgot === "passed" && da.current?.verify === undefined && da.current?.change === undefined) && <>
                        <div className="mb-4">
                            <label className="form-label" htmlFor="code">Verification code</label>
                            <input className="form-control" id="code" name="code" type="text" />
                            <div className="text-danger">{(data?.errors?.code != undefined) ? data.errors.code[0] : ""}</div>
                        </div>
                        {(blocked) ? <a>Code sent, wait 60 seconds</a> : <a href="#" onClick={e => {
                            e.preventDefault();
                            setBlocked(true);
                            const formdata = new FormData();
                            formdata.set("email", email.current);
                            formdata.set("forgot", "Forgot");
                            request(url, setData, "post", formdata)
                                .then(data => {
                                    if (data?.error) {
                                        alert(data.error);
                                    }
                                });
                        }}>Resend code</a>}
                        <br />
                        <br />
                        <button className="btn btn-primary w-100" type="submit" name="verify" value="Verify" onClick={e => {
                            execute(e);
                        }}> Submit Verification Code</button>
                    </>}
                    {(da.current?.verify === "passed" && da.current?.change === undefined) && <>
                        <div className="mb-4">
                            <label className="form-label" htmlFor="new_password">New password</label>
                            <input className="form-control" id="new_password" name="new_password" type="password" />
                            <div className="text-danger">{(data?.errors?.new_password != undefined) ? data.errors.new_password[0] : ""}</div>
                        </div>
                        <div className="mb-4">
                            <label className="form-label" htmlFor="confirm_new_password">Confirm new password</label>
                            <input className="form-control" id="confirm_new_password" name="confirm_new_password" type="password" />
                            <div className="text-danger">{(data?.errors?.confirm_new_password != undefined) ? data.errors.confirm_new_password[0] : ""}</div>
                        </div>
                        <button className="btn btn-primary w-100" type="submit" name="change" value="Change" onClick={e => {
                            execute(e);
                        }}> Change</button>
                    </>}
                </form>
                <div className="auth-footer">Remembered it? <Link to={login_url}>Back to signin</Link></div>
            </section>
        </main>
    </>)
}

export default ForgotPassword
