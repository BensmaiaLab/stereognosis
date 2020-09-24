/*

Will log to both console, and file.

This is setup for windows GUI. Should be called in window init, right after
AllocConsole(), something like:
`
BOOL InitInstance(HINSTANCE hInstance, int nCmdShow)
{
    ...
    AllocConsole();
    setupBoostLogging();
    ...
`

*/

#include "boostLog.h"

namespace logging = boost::log;
namespace src = boost::log::sources;
namespace sinks = boost::log::sinks;
namespace keywords = boost::log::keywords;


void setupBoostLogging() {
    FILE* fDummy;
    freopen_s(&fDummy, "CONIN$", "r", stdin);
    freopen_s(&fDummy, "CONOUT$", "w", stderr);
    freopen_s(&fDummy, "CONOUT$", "w", stdout);
    // Boost logging setup
    logging::add_common_attributes();
    logging::add_console_log(std::cout, boost::parameter::keyword<keywords::tag::format>::get() = "%TimeStamp%|%Severity% %Message%");
    logging::add_file_log(
        keywords::file_name = "stereognosis_%N.log",
        keywords::rotation_size = 10 * 1024 * 1024,
        keywords::time_based_rotation = sinks::file::rotation_at_time_point(0, 0, 0),
        keywords::format = "%TimeStamp%|%Severity% %Message%"
    );
    logging::core::get()->set_filter(logging::trivial::severity >= logging::trivial::info );
    BOOST_LOG_TRIVIAL(info) << "stuff";
}

