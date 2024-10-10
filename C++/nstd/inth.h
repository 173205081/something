#ifndef INTH_H
#define INTH_H

#include <string>
#include <stdexcept>

namespace nstd {
    class inth {
    public:
        inth(const std::string& hex_str) : value_(0) {
            if (!isValid(hex_str))
                throw std::runtime_error("Invalid hexadecimal number");

            value_ = std::stoul(hex_str, 0, 16);
        }

        inth(unsigned long value) : value_(value) {}

        std::string toHex() const {
            return "0x" + std::to_string(value_, 16);
        }

        unsigned long getValue() const {
            return value_;
        }

    private:
        unsigned long value_;

        static bool isValid(const std::string& hex_str) {
            if (hex_str.empty() || hex_str[0] != '0' || hex_str[1] != 'x')
                return false;
            for (size_t i = 2; i < hex_str.size(); ++i) {
                char c = hex_str[i];
                if (!(c >= '0' && c <= '9') && !(c >= 'A' && c <= 'F') && !(c >= 'a' && c <= 'f'))
                    return false;
            }
            return true;
        }
    };

    class invalid_inth : public std::runtime_error {
    public:
        invalid_inth(const std::string& what) : std::runtime_error(what + " is not an inth.") {}
    };
}

#endif  // INTH_H