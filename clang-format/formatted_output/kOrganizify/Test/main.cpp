#define CATCH_CONFIG_RUNNER

#include <QCoreApplication>

#include "../kOrganizify/src/task.h"
#include "catch.hpp"

int main(int argc, char *argv[]) {
  QCoreApplication a(argc, argv);
  return Catch::Session().run(argc, argv);
}
