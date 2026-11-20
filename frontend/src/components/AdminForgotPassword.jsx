import ForgotPassword from "./partials/ForgotPassword"

function AdminForgotPassword() {
    const url = "/admin_forgot_password";

    return (<ForgotPassword url={url} login_url={"/admin_signin"} />)
}

export default AdminForgotPassword
