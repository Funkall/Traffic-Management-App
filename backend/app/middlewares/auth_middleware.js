const jwt = require('jsonwebtoken');
const secretKey = process.env.JWT_SECRET;

if (!secretKey) {
    throw new Error("Missing JWT_SECRET in environment variables");
}

const authenticateUser = (req, res, next) => {
    const authHeader = req.headers['authorization'];

    if (!authHeader) {
        return res.status(403).json({ error: 'No token provided' });
    }

    // Ensure token follows "Bearer <token>" format
    const tokenParts = authHeader.split(' ');
    if (tokenParts.length !== 2 || tokenParts[0] !== 'Bearer') {
        return res.status(400).json({ error: 'Invalid token format. Use \"Bearer <token>\"' });
    }

    const token = tokenParts[1];

    jwt.verify(token, secretKey, (err, decoded) => {
        if (err) {
            return res.status(401).json({ error: err.name === 'TokenExpiredError' ? 'Token expired' : 'Invalid token' });
        }
        req.user = decoded;
        next();
    });
};

module.exports = { authenticateUser };
