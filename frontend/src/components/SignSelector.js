
import React, { useEffect, useState } from "react";

const SignSelector = () => {
    const [signs, setSigns] = useState([]);

    useEffect(() => {
        fetch("/assets/data/tmp_signs_list.json")
            .then((res) => res.json())
            .then((data) => setSigns(data))
            .catch((err) => console.error("Error loading sign data:", err));
    }, []);

    return (
        <div className="p-4">
            <h2 className="text-xl font-semibold mb-4">Select a Traffic Sign</h2>
            <div className="grid grid-cols-2 md:grid-cols-4 lg:grid-cols-6 gap-4">
                {signs.map((sign) => (
                    <div key={sign.code} className="border p-2 rounded shadow hover:shadow-lg">
                        <img
                            src={sign.image}
                            alt={sign.description}
                            className="w-full h-24 object-contain mb-2"
                            onError={(e) => {
                                e.target.src = "/assets/images/signs/placeholder.png";
                                e.target.alt = "Image not found";
                            }}
                        />
                        <p className="text-sm font-medium">{sign.code}</p>
                        <p className="text-xs text-gray-600">{sign.description}</p>
                    </div>
                ))}
            </div>
        </div>
    );
};

export default SignSelector;
