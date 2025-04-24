module.exports = class Sign {
    constructor(code, name, description, image, size, type, placement_rules) {
        this.code = code;
        this.name = name;
        this.description = description;
        this.image = image;
        this.size = size;
        this.type = type;
        this.placement_rules = placement_rules;
    }
};
