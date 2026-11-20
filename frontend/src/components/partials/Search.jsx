import { useRef } from "react"
import { request } from "../../utilities/request"
import { query } from "../../utilities/query"

function Search({ refs: { sort, filter }, queries, url, setData }) {
    const search = useRef(null);

    return (<form onSubmit={e => e.preventDefault()}>
        <input ref={search} className="form-control form-control-sm table-search" type="search" placeholder="Search" aria-label="Search users" />
        <div className="text-end mt-2">
            <button type="submit" className="btn btn-primary btn-sm" onClick={() => {
                (sort != "") ? sort.current.reset() : "";
                filter.current.reset();
                queries.current = {};
                queries.current.search = search.current.value;
                request(url + query(queries), setData);
            }}>Search</button>
        </div>
    </form>)
}

export default Search
