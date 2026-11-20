function CurrentPassword({ current_password, error }) {
    return (<div className="col-md-6">
        <label className="form-label" htmlFor="current_password">Current Password</label>
        <input ref={current_password} className="form-control" id="current_password" name="current_password" type="password" />
        <div className="pass-err text-danger" hidden>{(error != undefined) ? error[0] : ""}</div>
    </div>)
}

export default CurrentPassword
