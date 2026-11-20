import { useEffect } from "react"
import { useLocation } from "react-router-dom"
import { initialize } from "../utilities/initialize"

function Initialize() {
    const location = useLocation();

    useEffect(() => {
        initialize();
        window.scrollTo({
            top: 0,
            left: 0,
            behavior: "instant"
        });
    }, [location]);

    return null
}

export default Initialize
