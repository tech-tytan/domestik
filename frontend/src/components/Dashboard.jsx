import { useState, useEffect } from "react"
import { Navigate, Link } from "react-router-dom"
import { request } from "../utilities/request"
import { money_format } from "../utilities/currency"
import AdminNav from "./partials/AdminNav"
import AdminHeader from "./partials/AdminHeader"
import Footer from "./partials/Footer"

function Dashboard() {
    const [data, setData] = useState({});
    const url = "/dashboard";
    const authCheck = (data?.status != undefined && data.status === "failed") ? false : true;

    useEffect(() => {
        request(url, setData);
    }, []);

    return (<>
        {(!authCheck) ? <Navigate to="/admin_signin" /> : ""}
        <AdminNav />
        <div className="admin-main">
            <AdminHeader da={data} />
            <main className="dashboard-content">
                <div className="container-fluid px-3 px-lg-4 py-4">
                    <div className="page-heading">
                        <div className="page-heading-copy">
                            <span className="page-icon"><i className="bi bi-speedometer2" aria-hidden="true"></i></span>
                            <div>
                                <p className="eyebrow mb-1">Overview</p>
                                <h1 className="h3 mb-1">Dashboard</h1>
                                <p className="text-muted mb-0">Monitor users, locations, and transactions from one clean workspace.</p>
                            </div>
                        </div>
                    </div>

                    <section className="row g-3 mt-1" aria-label="Dashboard metrics">
                        <div className="col-12 col-sm-6 col-xl-4">
                            <article className="metric-card metric-primary">
                                <div className="metric-top">
                                    <span className="metric-label">Users</span>
                                    <span className="metric-icon"><i className="bi bi-people" aria-hidden="true"></i></span>
                                </div>
                                <div className="metric-value">{(data?.users != undefined) ? data.users : ""}</div>
                            </article>
                        </div>

                        <div className="col-12 col-sm-6 col-xl-4">
                            <article className="metric-card metric-success">
                                <div className="metric-top">
                                    <span className="metric-label">Locations</span>
                                    <span className="metric-icon"><i className="bi bi-map" aria-hidden="true"></i></span>
                                </div>
                                <div className="metric-value">{(data?.locations != undefined) ? data.locations : ""}</div>
                            </article>
                        </div>

                        <div className="col-12 col-sm-6 col-xl-4">
                            <article className="metric-card metric-warning">
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
                            <Link className="btn btn-outline-secondary btn-sm" to="/transactions">View All Transactions</Link>
                        </div>
                        <div className="table-responsive">
                            <table className="table align-middle mb-0">
                                <thead><tr><th scope="col">User</th><th scope="col">Reference</th><th scope="col">Amount</th><th scope="col">Date</th><th scope="col">Months</th><th scope="col">Status</th></tr></thead>
                                <tbody>
                                    {(data?.transactions != undefined && data.transactions.length > 0) ? data.transactions.map((item, index) => <tr key={item.index}>
                                        <td>
                                            <div className="d-flex align-items-center gap-2">
                                                <div>
                                                    <p className="fw-semibold mb-0">{`${item.first_name} ${item.last_name}`}</p>
                                                    <p className="text-muted small mb-0">{`${item.email_address}, ${item.phone_number}`}</p>
                                                </div>
                                            </div>
                                        </td>
                                        <td>{item.ref}</td>
                                        <td>NGN {money_format(item.amount_paid)}</td>
                                        <td>{item.date_time}</td>
                                        <td>{item.months}</td>
                                        <td>{(item.state === "confirmed") ? <span className="badge text-bg-success">{item.state}</span> : (item.state === "pending") ? <span className="badge text-bg-warning">{item.state}</span> : <span className="badge text-bg-danger">{item.state}</span>}</td>
                                    </tr>) : <tr>
                                        <td colSpan="6" className="text-center">No transaction yet.</td>
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

export default Dashboard
