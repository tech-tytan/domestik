import { useState, useRef, useEffect } from "react"
import { Navigate } from "react-router-dom"
import { request } from "../utilities/request"
import { query } from "../utilities/query"
import { money_format } from "../utilities/currency"
import AdminNav from "./partials/AdminNav"
import AdminHeader from "./partials/AdminHeader"
import Search from "./partials/Search"
import Pagination from "./partials/Pagination"
import Footer from "./partials/Footer"

function Transactions() {
    const [data, setData] = useState({});
    const queries = useRef({});
    const filter = useRef(null);
    const from = useRef(null);
    const to = useRef(null);
    const status = useRef(null);
    const url = "/transactions";
    const authCheck = (data?.status != undefined && data.status === "failed") ? false : true;

    function execute(name, value, e) {
        const formdata = new FormData();
        formdata.set("id", e.target.dataset.id);
        formdata.set(name, value);
        request(url + query(queries), setData, "post", formdata);
    }

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
                            <span className="page-icon"><i className="bi bi-credit-card" aria-hidden="true"></i></span>
                            <div>
                                <p className="eyebrow mb-1">Management</p>
                                <h1 className="h3 mb-1">Transactions</h1>
                                <p className="text-muted mb-0">Review transactions, and their status.</p>
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
                                <p className="text-muted mb-0">Search, review, and manage transactions.</p>
                            </div>
                            <div className="d-flex flex-wrap gap-2">
                                <Search refs={{ sort: "", filter }} queries={queries} url={url} setData={setData} />
                                <form ref={filter} onSubmit={e => e.preventDefault()}>
                                    <input ref={from} type="text" className="form-control" placeholder="2026-01-01" />
                                    <input ref={to} type="text" className="form-control" placeholder="2027-01-01" />
                                    <select ref={status} className="form-select">
                                        <option value="">Status</option>
                                        <option value="confirmed">Confirmed</option>
                                        <option value="pending">Pending</option>
                                        <option value="canceled">Canceled</option>
                                    </select>
                                    <div className="text-end mt-2">
                                        <button type="submit" className="btn btn-primary btn-sm" onClick={() => {
                                            queries.current.page = 1;
                                            queries.current.from = from.current.value;
                                            queries.current.to = to.current.value;
                                            queries.current.status = status.current.value;
                                            request(url + query(queries), setData);
                                        }}>Filter</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div className="table-responsive">
                            <table className="table align-middle mb-0" id="usersTable" data-searchable-table>
                                <thead><tr><th scope="col">User</th><th scope="col">Reference</th><th scope="col">Amount</th><th scope="col">Date</th><th scope="col">Months</th><th scope="col">Status</th><th scope="col" className="text-end">Action</th></tr></thead>
                                <tbody>
                                    {(data?.transactions?.data != undefined && data.transactions.data.length > 0) ? data.transactions.data.map((item, index) => <tr key={item.index}>
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
                                        <td className="text-end">
                                            {(item.state === "pending") ?
                                                <>
                                                    <button className="btn btn-success" type="submit" data-id={item.index} onClick={e => {
                                                        execute("confirm", "Confirm", e);
                                                    }}><i className="bi bi-check2-circle" aria-hidden="true"></i> Confirm</button>
                                                    <button className="btn btn-danger mt-1" type="submit" data-id={item.index} onClick={e => {
                                                        execute("cancel", "Cancel", e);
                                                    }}><i className="bi bi-slash-circle" aria-hidden="true"></i> Cancel</button>
                                                </> : ""}
                                        </td>
                                    </tr>) : <tr>
                                        <td colSpan="7" className="text-center">No transaction yet.</td>
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

export default Transactions
