export function clearError(ref) {
    ref.current.querySelectorAll(".err").forEach(element => {
        element.hidden = true;
    });
}

export function showError(ref) {
    ref.current.querySelectorAll(".err,.pass-err").forEach(element => {
        element.hidden = false;
    });
}
