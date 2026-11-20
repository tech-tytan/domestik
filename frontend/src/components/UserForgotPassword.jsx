import ForgotPassword from "./partials/ForgotPassword"

function UserForgotPassword() {
    const url = "/user_forgot_password";

    return (<ForgotPassword url={url} login_url={"/signin"} />)
}

export default UserForgotPassword
