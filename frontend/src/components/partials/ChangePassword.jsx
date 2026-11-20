import { useRef } from "react"
import CurrentPassword from "./CurrentPassword"

function ChangePassword({ data, setData, showPassword, current_password, execute }) {
    const password = useRef(null);
    const id = "password";

    return (<form className="panel" ref={password} onSubmit={e => e.preventDefault()}>
        <div className="panel-header"><div><h2 className="h5 mb-1 section-title"><i className="bi bi-eye-slash" aria-hidden="true"></i><span>Password</span></h2><p className="text-muted mb-0">Update your password.</p></div></div>
        <div className="row g-3">
            <div className="col-md-6">
                <label className="form-label" htmlFor="new_password">New Password</label>
                <input className="form-control" id="new_password" name="new_password" type="password" />
                <div className="text-danger">{(data?.errors?.new_password != undefined) ? data.errors.new_password[0] : ""}</div>
            </div>
            <div className="col-md-6">
                <label className="form-label" htmlFor="confirm_new_password">Confirm New Password</label>
                <input className="form-control" id="confirm_new_password" name="confirm_new_password" type="password" />
                <div className="text-danger">{(data?.errors?.confirm_new_password != undefined) ? data.errors.confirm_new_password[0] : ""}</div>
            </div>
            {(showPassword === id) ? <CurrentPassword current_password={current_password} error={data?.errors?.current_password} /> : ""}
        </div>
        <div className="d-flex justify-content-end mt-4">
            <button className="btn btn-primary" type="submit" name="change" value="Change" onClick={e => {
                execute("password", password, e, setData);
            }}><i className="bi bi-check2-circle" aria-hidden="true"></i> Change</button>
        </div>
    </form>)
}

export default ChangePassword
