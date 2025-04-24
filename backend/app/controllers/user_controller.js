// ✅ Register User
exports.registerUser = (req, res) => {
    res.json({ message: "User registered successfully!" });
};

// ✅ Login User
exports.loginUser = (req, res) => {
    res.json({ message: "Login successful!", token: "your_jwt_token_here" });
};
