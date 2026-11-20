export function query(queries) {
    const qs = queries.current;
    let query = "?";
    for (let key in qs) {
        query += key + "=" + qs[key] + "&";
    }
    return (query != "?") ? query.slice(0, query.length - 1) : "";
}
