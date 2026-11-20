import { BrowserRouter, Routes, Route } from 'react-router-dom'
import Initialize from './components/Initialize'
import Home from './components/Home'
import AdminSignin from './components/AdminSignin'
import AdminForgotPassword from './components/AdminForgotPassword'
import Dashboard from './components/Dashboard'
import Transactions from './components/Transactions'
import Users from './components/Users'
import Locations from './components/Locations'
import AddLocation from './components/partials/AddLocation'
import EditLocation from './components/partials/EditLocation'
import AdminProfile from './components/AdminProfile'
import UserSignin from './components/UserSignin'
import UserForgotPassword from './components/UserForgotPassword'
import Register from './components/Register'
import Overview from './components/Overview'
import UserTransactions from './components/UserTransactions'
import UserProfile from './components/UserProfile'
import Verify from './components/Verify'

function App() {

  return (
    <BrowserRouter>
      <Initialize />
      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/admin_signin" element={<AdminSignin />} />
        <Route path="/admin_forgot_password" element={<AdminForgotPassword />} />
        <Route path="/dashboard" element={<Dashboard />} />
        <Route path="/transactions" element={<Transactions />} />
        <Route path="/users" element={<Users />} />
        <Route path="/locations" element={<Locations />} />
        <Route path="/add_location" element={<AddLocation />} />
        <Route path="/edit_location/:id" element={<EditLocation />} />
        <Route path="/profile" element={<AdminProfile />} />
        <Route path="/signin" element={<UserSignin />} />
        <Route path="/forgot_password" element={<UserForgotPassword />} />
        <Route path="/register" element={<Register />} />
        <Route path="/overview" element={<Overview />} />
        <Route path="/my_transactions" element={<UserTransactions />} />
        <Route path="/my_profile" element={<UserProfile />} />
        <Route path="/verify" element={<Verify />} />
      </Routes>
    </BrowserRouter>
  )
}

export default App
