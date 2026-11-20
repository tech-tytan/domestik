export function money_format(amount) {
    const formatter = new Intl.NumberFormat("en-NG", {
        style: "decimal",
        minimumFractionDigits: 2,
        maximumFractionDigits: 16
    });
    return formatter.format(amount);
}
