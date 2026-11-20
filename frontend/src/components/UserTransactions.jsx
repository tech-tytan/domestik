import { useState, useRef, useEffect } from "react"
import { Navigate } from "react-router-dom"
import { request } from "../utilities/request"
import { query } from "../utilities/query"
import { money_format } from "../utilities/currency"
import UserNav from "./partials/UserNav"
import UserHeader from "./partials/UserHeader"
import Pagination from "./partials/Pagination"
import Footer from "./partials/Footer"

function UserTransactions() {
    const [data, setData] = useState({});
    const queries = useRef({});
    const url = "/user_transactions";
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
                            <span className="page-icon"><i className="bi bi-credit-card" aria-hidden="true"></i></span>
                            <div>
                                <p className="eyebrow mb-1">Management</p>
                                <h1 className="h3 mb-1">Transactions</h1>
                                <p className="text-muted mb-0">Review transactions.</p>
                            </div>
                        </div>
                    </div>

                    <section className="row g-3 mt-1" aria-label="User summary">
                        <div className="col-12 col-sm-6 col-xl-4">
                            <article className="metric-card metric-success">
                                <div className="metric-top">
                                    <span className="metric-label">Confirmed Transactions</span>
                                    <span className="metric-icon"><i className="bi bi-credit-card" aria-hidden="true"></i></span>
                                </div>
                                <div className="metric-value">{(data?.transactions_confirmed_count != undefined) ? data.transactions_confirmed_count : ""}</div>
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

                        <div className="col-12 col-sm-6 col-xl-4">
                            <article className="metric-card metric-danger">
                                <div className="metric-top">
                                    <span className="metric-label">Canceled Transactions</span>
                                    <span className="metric-icon"><i className="bi bi-credit-card" aria-hidden="true"></i></span>
                                </div>
                                <div className="metric-value">{(data?.transactions_canceled_count != undefined) ? data.transactions_canceled_count : ""}</div>
                            </article>
                        </div>
                    </section>

                    <section className="panel mt-3">
                        <div className="panel-header">
                            <div>
                                <h2 className="h5 mb-1 section-title"><i className="bi bi-table" aria-hidden="true"></i><span>Transaction List</span></h2>
                                <p className="text-muted mb-0">Review transactions.</p>
                            </div>
                        </div>
                        <div className="table-responsive">
                            <table className="table align-middle mb-0" id="usersTable" data-searchable-table>
                                <thead><tr><th scope="col">Reference</th><th scope="col">Amount</th><th scope="col">Date</th><th scope="col">Months</th><th scope="col">Status</th></tr></thead>
                                <tbody>
                                    {(data?.transactions?.data != undefined && data.transactions.data.length > 0) ? data.transactions.data.map((item, index) => <tr key={item.index}>
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
                        <Pagination data={data?.transactions} total={data?.transactions_count} url={url} queries={queries} setData={setData} />
                    </section>
                </div>
            </main>
            <Footer />
        </div>
    </>)
}

export default UserTransactions
