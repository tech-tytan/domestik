import { useState, useRef, useEffect } from "react"
import { Link, Navigate } from "react-router-dom"
import { request } from "../utilities/request"
import { money_format } from "../utilities/currency"
import UserNav from "./partials/UserNav"
import UserHeader from "./partials/UserHeader"
import Footer from "./partials/Footer"

function Overview() {
    const [data, setData] = useState({});
    const [amount, setAmount] = useState("");
    const pay = useRef(null);
    const url = "/overview";
    const milliseconds = 1000;
    const fee = data?.fee;
    const expirationDate = data?.expiration_date;
    const date = new Date((expirationDate != undefined) ? (expirationDate * milliseconds) : null);
    const formattedDate = `${date.getDate()}-${(date.getMonth() + 1)}-${date.getFullYear()}`;
    const authCheck = (data?.status != undefined && data.status === "failed") ? false : true;

    useEffect(() => {
        request(url, setData);
    }, []);

    return (<>
        {(!authCheck) ? <Navigate to="/signin" /> : ""}
        <UserNav />
        <div className="admin-main">
            <UserHeader da={data} />
            <main className="dashboard-content">
                <div className="container-fluid px-3 px-lg-4 py-4">
                    <div className="page-heading">
                        <div className="page-heading-copy">
                            <span className="page-icon"><i className="bi bi-speedometer2" aria-hidden="true"></i></span>
                            <div>
                                <p className="eyebrow mb-1">Overview</p>
                                <h1 className="h3 mb-1">Dashboard</h1>
                                <p className="text-muted mb-0">Monitor transactions from one clean workspace.</p>
                            </div>
                        </div>
                    </div>

                    <section className="row g-3 mt-1" aria-label="Dashboard metrics">
                        <div className="col-12 col-sm-6 col-xl-6">
                            <article className="metric-card metric-primary">
                                <div className="metric-top">
                                    <span className="metric-label">Subscribe</span>
                                    <span className="metric-icon"><i className="bi bi-credit-card" aria-hidden="true"></i></span>
                                </div>
                                <div>
                                    <form ref={pay} onSubmit={e => e.preventDefault()}>
                                        <div className="row align-items-center mt-1">
                                            <div className="col-6">
                                                <span>Fee: </span><span className="fw-bold">{(fee != undefined) ? `NGN ${money_format(fee)}` : ""}</span>
                                                {(amount != "") ? <>
                                                    <br />
                                                    <span>Total: </span><span className="fw-bold">NGN {money_format(amount)}</span>
                                                </> : ""}
                                            </div>
                                            <div className="col-6">
                                                <label className="form-label" htmlFor="months">No. of Months</label>
                                                <br />
                                                <input type="number" id="months" name="months" className="form-control form-control-sm d-inline w-50 me-2" defaultValue="1" onInput={e => {
                                                    const value = e.target.value;
                                                    if (value != "") {
                                                        const num = Number(value.replace(/[-+]g/, ""));
                                                        if (num != NaN && num > 0) {
                                                            { (fee != undefined) ? setAmount(num * Number(fee)) : "" }
                                                        }
                                                        else {
                                                            setAmount("");
                                                        }
                                                    }
                                                    else {
                                                        setAmount("");
                                                    }
                                                }} />
                                                <button type="submit" className="btn btn-sm btn-success" name="pay" value="Pay" onClick={e => {
                                                    const formdata = new FormData(pay.current, e.target);
                                                    request(url, setData, "post", formdata, e)
                                                        .then(data => {
                                                            if (data?.payment_link != undefined) {
                                                                location.href = data.payment_link;
                                                            }
                                                        });
                                                }}>Pay</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <div className="metric-meta">
                                    {(expirationDate === undefined) ? <span className="text-danger">You do not have an active subscription</span> : (Date.now() >= (expirationDate * milliseconds)) ? <span className="text-danger">You subscription expired on {formattedDate}</span> : <span className="text-success">You have an active subscription, it expires on {formattedDate}</span>}
                                </div>
                            </article>
                        </div>

                        <div className="col-12 col-sm-6 col-xl-6">
                            <article className="metric-card metric-warning h-100">
                                <div className="metric-top">
                                    <span className="metric-label">Pending Transactions</span>
                                    <span className="metric-icon"><i className="bi bi-credit-card" aria-hidden="true"></i></span>
                                </div>
                                <div className="metric-value">{(data?.transactions_pending_count != undefined) ? data.transactions_pending_count : ""}</div>
                            </article>
                        </div>
                    </section>

                    <section className="panel mt-3">
                        <div className="panel-header">
                            <div>
                                <h2 className="h5 mb-1 section-title"><i className="bi bi-credit-card" aria-hidden="true"></i><span>Recent Transactions</span></h2>
                                <p className="text-muted mb-0">Latest transactions.</p>
                            </div>
                            <Link className="btn btn-outline-secondary btn-sm" to="/my_transactions">View All Transactions</Link>
                        </div>
                        <div className="table-responsive">
                            <table className="table align-middle mb-0">
                                <thead><tr><th scope="col">Reference</th><th scope="col">Amount</th><th scope="col">Date</th><th scope="col">Months</th><th scope="col">Status</th></tr></thead>
                                <tbody>
                                    {(data?.transactions != undefined && data.transactions.length > 0) ? data.transactions.map((item, index) => <tr key={item.index}>
                                        <td>{item.ref}</td>
                                        <td>NGN {money_format(item.amount_paid)}</td>
                                        <td>{item.date_time}</td>
                                        <td>{item.months}</td>
                                        <td>{(item.state === "confirmed") ? <span className="badge text-bg-success">{item.state}</span> : (item.state === "pending") ? <span className="badge text-bg-warning">{item.state}</span> : <span className="badge text-bg-danger">{item.state}</span>}</td>
                                    </tr>) : <tr>
                                        <td colSpan="5" className="text-center">No transaction yet.</td>
                                    </tr>}
                                </tbody>
                            </table>
                        </div>
                    </section>
                </div>
            </main>
            <Footer />
        </div>
    </>)
}

export default Overview
