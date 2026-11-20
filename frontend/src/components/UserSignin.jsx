import Signin from "./partials/Signin"

function UserSignin() {
    const url = "/user_signin";

    return (<Signin url={url} forgot_url={"/forgot_password"} destination={"/overview"} />)
}

export default UserSignin
