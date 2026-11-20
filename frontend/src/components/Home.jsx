import { useState, useEffect } from "react"
import { Link } from "react-router-dom"
import { money_format } from "../utilities/currency"
import { request } from "../utilities/request"

function Home() {
    const [data, setData] = useState({});
    const fee = (data?.fee != undefined) ? data.fee : "";
    const date = new Date();

    useEffect(() => {
        request("/home", setData);
    }, []);

    return (<>
        {/* Navigation Bar */}
        <nav className="navbar-landing container-fluid px-3 px-lg-4">
            <div
                style={{
                    display: "flex",
                    alignItems: "center",
                    justifyContent: "space-between",
                    padding: 0,
                    margin: "0 auto",
                    maxWidth: 1400,
                    width: "100%"
                }}
            >
                <Link className="navbar-brand-landing" to="/">
                    <span className="navbar-brand-icon">
                        <i className="bi bi-leaf" aria-hidden="true" />
                    </span>
                    <span>Domestik</span>
                </Link>
                <div className="navbar-landing-buttons">
                    <button
                        className="icon-button theme-toggle"
                        type="button"
                        data-theme-toggle=""
                        aria-label="Switch color theme"
                        title="Switch color theme"
                    >
                        <i
                            className="bi bi-moon-stars"
                            data-theme-icon=""
                            aria-hidden="true"
                        />
                    </button>
                    <Link className="nav-btn nav-signin" to="/signin">
                        <i className="bi bi-box-arrow-in-right" aria-hidden="true" /> Sign In
                    </Link>
                </div>
            </div>
        </nav>
        {/* Hero Section */}
        <section className="landing-hero">
            <div className="container-fluid px-3 px-lg-4">
                <div style={{ maxWidth: 1400, margin: "0 auto", width: "100%" }}>
                    <div className="row align-items-center">
                        <div className="col-lg-6 hero-content">
                            <h1>Keep Your Home Beautiful &amp; Waste-Free</h1>
                            <p className="lead">
                                Domestik provides professional gardening and waste disposal
                                services delivered right to your doorstep. Just NGN {money_format(fee)} per
                                month and you're all set!
                            </p>
                            <div className="cta-buttons">
                                <Link className="cta-primary" to="/register">
                                    <i className="bi bi-check-circle" aria-hidden="true" />
                                    Start Your Service - NGN {money_format(fee)}/month
                                </Link>
                                <Link className="cta-secondary" to="/signin">
                                    <i className="bi bi-box-arrow-in-right" aria-hidden="true" />
                                    Sign In
                                </Link>
                            </div>
                            <p style={{ color: "var(--admin-muted)", fontSize: "0.95rem" }}>
                                <i
                                    className="bi bi-shield-check"
                                    aria-hidden="true"
                                    style={{ color: "var(--admin-success)" }}
                                />{" "}
                                Reliable •{" "}
                                <i
                                    className="bi bi-lightning-charge"
                                    aria-hidden="true"
                                    style={{ color: "var(--admin-warning)" }}
                                />{" "}
                                Professional •{" "}
                                <i
                                    className="bi bi-star"
                                    aria-hidden="true"
                                    style={{ color: "var(--admin-primary)" }}
                                />{" "}
                                Affordable
                            </p>
                        </div>
                        <div className="col-lg-6">
                            <div className="hero-image">
                                <img
                                    src="/assets/images/brand/service.jpg"
                                    alt="Service"
                                />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        {/* Stats Section */}
        <section className="stats-section">
            <div className="container-fluid px-3 px-lg-4">
                <div style={{ maxWidth: 1400, margin: "0 auto", width: "100%" }}>
                    <div className="row">
                        <div className="col-md-4 stat-item">
                            <div className="stat-number">1000+</div>
                            <div className="stat-label">Happy Customers</div>
                        </div>
                        <div className="col-md-4 stat-item">
                            <div className="stat-number">5000+</div>
                            <div className="stat-label">Homes Served</div>
                        </div>
                        <div className="col-md-4 stat-item">
                            <div className="stat-number">100%</div>
                            <div className="stat-label">Satisfaction Rate</div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        {/* Features Section */}
        <section className="features-section">
            <div className="container-fluid px-3 px-lg-4">
                <div style={{ maxWidth: 1400, margin: "0 auto", width: "100%" }}>
                    <div className="features-title">
                        <h2>Our Services</h2>
                        <p>Comprehensive solutions for a cleaner, greener home</p>
                    </div>
                    <div className="row g-4">
                        <div className="col-md-6 col-lg-4">
                            <div className="feature-card">
                                <div className="feature-icon">
                                    <i className="bi bi-flower1" aria-hidden="true" />
                                </div>
                                <h3>Garden Maintenance</h3>
                                <p>
                                    Professional lawn mowing, weeding, pruning, and landscaping to
                                    keep your garden looking pristine.
                                </p>
                            </div>
                        </div>
                        <div className="col-md-6 col-lg-4">
                            <div className="feature-card">
                                <div className="feature-icon">
                                    <i className="bi bi-trash" aria-hidden="true" />
                                </div>
                                <h3>Waste Disposal</h3>
                                <p>
                                    Efficient and eco-friendly waste removal and disposal from your
                                    home every week.
                                </p>
                            </div>
                        </div>
                        <div className="col-md-6 col-lg-4">
                            <div className="feature-card">
                                <div className="feature-icon">
                                    <i className="bi bi-leaf" aria-hidden="true" />
                                </div>
                                <h3>Composting Service</h3>
                                <p>
                                    Turn organic waste into valuable compost for your garden with
                                    our sustainable composting program.
                                </p>
                            </div>
                        </div>
                        <div className="col-md-6 col-lg-4">
                            <div className="feature-card">
                                <div className="feature-icon">
                                    <i className="bi bi-calendar-check" aria-hidden="true" />
                                </div>
                                <h3>Scheduled Pickups</h3>
                                <p>
                                    Flexible weekly or bi-weekly collection schedules tailored to
                                    your specific needs.
                                </p>
                            </div>
                        </div>
                        <div className="col-md-6 col-lg-4">
                            <div className="feature-card">
                                <div className="feature-icon">
                                    <i className="bi bi-telephone" aria-hidden="true" />
                                </div>
                                <h3>Customer Support</h3>
                                <p>
                                    Dedicated support team available to address your concerns and
                                    requests promptly.
                                </p>
                            </div>
                        </div>
                        <div className="col-md-6 col-lg-4">
                            <div className="feature-card">
                                <div className="feature-icon">
                                    <i className="bi bi-geo-alt" aria-hidden="true" />
                                </div>
                                <h3>Lagos Coverage</h3>
                                <p>
                                    Serving all major areas across Lagos with reliable and timely
                                    service delivery.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        {/* CTA Section */}
        <section
            style={{
                background:
                    "linear-gradient(135deg, #f8fbff 0%, #eaf2ff 44%, #eef8f6 100%)",
                padding: "4rem 0"
            }}
        >
            <div className="container-fluid px-3 px-lg-4">
                <div style={{ maxWidth: 1400, margin: "0 auto", width: "100%" }}>
                    <div className="cta-section">
                        <h2>Transform Your Home Today</h2>
                        <p>
                            Join thousands of satisfied customers enjoying clean homes and
                            beautiful gardens. Just NGN {money_format(fee)} per month!
                        </p>
                        <div
                            style={{
                                display: "flex",
                                gap: "1rem",
                                justifyContent: "center",
                                flexWrap: "wrap"
                            }}
                        >
                            <Link
                                className="cta-primary"
                                to="/register"
                                style={{ padding: "1rem 2.5rem", fontSize: "1.05rem" }}
                            >
                                <i className="bi bi-check-circle" aria-hidden="true" /> Register Now - NGN {money_format(fee)}/month
                            </Link>
                            <Link
                                className="cta-secondary"
                                to="/signin"
                                style={{ padding: "1rem 2.5rem", fontSize: "1.05rem" }}
                            >
                                <i className="bi bi-box-arrow-in-right" aria-hidden="true" /> Sign In
                            </Link>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        {/* Footer */}
        <footer className="footer-landing">
            <div
                className="container-fluid px-3 px-lg-4"
                style={{ maxWidth: 1400, margin: "0 auto", width: "100%" }}
            >
                <p>
                    &copy; Copyright {date.getFullYear()} Domestik.
                </p>
            </div>
        </footer>
    </>)
}

export default Home
