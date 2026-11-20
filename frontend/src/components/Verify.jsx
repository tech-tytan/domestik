import { useState, useEffect } from "react"
import { useNavigate } from "react-router-dom"
import { request } from "../utilities/request"

function Verify() {
    const [data, setData] = useState({});
    const navigate = useNavigate();
    const url = "/verify";
    const status = data?.status;

    useEffect(() => {
        request(url + location.search, setData);
    }, []);

    return (<div className="p-5">
        <main className="dashboard-content p-5">
            <div className="container-fluid px-4 py-4">

                <section className="row justify-content-center align-items-center">
                    <div className="col-md-6 text-center">
                        {(status != undefined) ? (status === "success") ? <p className="text-success">Your payment has been successfully verified.</p> : <p className="text-danger">Payment verification failed.</p> : ""}
                        <button className="btn btn-primary" onClick={e => {
                            navigate("/overview");
                        }}>Go to dashboard</button>
                    </div>
                </section>
            </div>
        </main>
    </div>)
}

export default Verify
