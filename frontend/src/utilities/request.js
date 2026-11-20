import { destination } from "./config"
import Cookies from "js-cookie"

export function request(url, setData, method = "get", data = "", obj = "") {
    const cookie = Cookies.get("XSRF-TOKEN");
    const dest = destination + ((url === "/sanctum/csrf-cookie") ? url : "/api" + url);
    const payload = {
        method: method.toUpperCase(),
        credentials: "include",
        headers: {
            "Accept": "application/json",
            "Origin": "http://localhost:5173",
            "X-XSRF-TOKEN": (cookie != undefined) ? cookie : ""
        }
    };

    if (obj != "") {
        obj.target.disabled = true;
    }

    return fetch(dest, (data != "") ? { ...payload, body: data } : payload)
        .then(data => {
            if (obj != "") {
                obj.target.disabled = false;
            }
            if (url != "/sanctum/csrf-cookie") {
                return data.json();
            }
        })
        .then(data => {
            setData(data);
            return data;
        });
}
