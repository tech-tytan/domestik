import { request } from "../../utilities/request"
import { query } from "../../utilities/query"

function Pagination({ data, total, url, queries, setData }) {
    const d = (data != undefined) ? true : false;
    const current_page = (d) ? data.current_page : "";
    const last_page = (d) ? data.last_page : "";
    const current_total = (d) ? data.data.length : "";
    const count = (total != undefined) ? total : "";
    const limit = 5;
    const current_limit = (last_page <= limit) ? last_page : limit;

    function execute(type, page = "") {
        if (current_page != "" && last_page != "") {
            if (type === "previous") {
                queries.current.page = (current_page > 1) ? current_page - 1 : 1;
            }
            else {
                queries.current.page = (page != "") ? page : (last_page > current_page) ? current_page + 1 : current_page;
            }
            request(url + query(queries), setData);
        }
    }

    return (<div className="d-flex flex-column flex-sm-row align-items-sm-center justify-content-between gap-3 mt-3">
        <p className="text-muted small mb-0">Showing 1 to {current_total} of {count} items</p>
        <nav aria-label="Users pagination">
            <ul className="pagination pagination-sm mb-0">
                <li className="page-item">
                    <a className="page-link" href="#" onClick={e => {
                        e.preventDefault();
                        execute("previous");
                    }}>Previous</a>
                </li>
                {(current_page != "" && last_page != "") ? Array.from({ length: current_limit }).map((_, index) => {
                    const evaluation = (last_page - current_page);
                    const page = ((evaluation < limit) ? (last_page - current_limit) + 1 : current_page) + index;
                    return <li key={index} className="page-item active">
                        <a className="page-link" data-page={page} href="#" onClick={e => {
                            e.preventDefault();
                            execute("next", e.target.dataset.page);
                        }}>{page}</a>
                    </li>
                }) : ""}
                <li className="page-item">
                    <a className="page-link" href="#" onClick={e => {
                        e.preventDefault();
                        execute("next");
                    }}>Next</a>
                </li>
            </ul>
        </nav>
    </div>)
}

export default Pagination
