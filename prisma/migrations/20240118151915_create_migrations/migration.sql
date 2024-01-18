-- CreateTable
CREATE TABLE "users" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "cpf" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "is_adm" BOOLEAN NOT NULL DEFAULT false,
    "is_active" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL
);

-- CreateTable
CREATE TABLE "clients" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "corporate_reason" TEXT NOT NULL,
    "cnpj_cpf" TEXT NOT NULL,
    "state_registration" TEXT,
    "municipal_registration" TEXT,
    "cep" TEXT NOT NULL,
    "street" TEXT NOT NULL,
    "city" TEXT NOT NULL,
    "state" TEXT NOT NULL,
    "phone" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL
);

-- CreateTable
CREATE TABLE "agencys" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "corporate_reason" TEXT NOT NULL,
    "cnpj_cpf" TEXT NOT NULL,
    "state_registration" TEXT,
    "municipal_registration" TEXT,
    "cep" TEXT NOT NULL,
    "street" TEXT NOT NULL,
    "city" TEXT NOT NULL,
    "state" TEXT NOT NULL,
    "phone" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "site" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL
);

-- CreateTable
CREATE TABLE "insertion_requests" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "insertion_request" INTEGER NOT NULL,
    "emission_date" DATETIME NOT NULL,
    "pit_number" TEXT NOT NULL,
    "plano_number" TEXT NOT NULL,
    "spreadsheet" TEXT NOT NULL,
    "product" TEXT NOT NULL,
    "campain" TEXT NOT NULL,
    "padv" TEXT NOT NULL,
    "order_of_service" TEXT NOT NULL,
    "gross_value" REAL NOT NULL,
    "agency_comission" REAL NOT NULL,
    "net_value" REAL NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL,
    "agencyId" INTEGER NOT NULL,
    "clientId" INTEGER NOT NULL,
    "userId" INTEGER NOT NULL,
    CONSTRAINT "insertion_requests_agencyId_fkey" FOREIGN KEY ("agencyId") REFERENCES "agencys" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "insertion_requests_clientId_fkey" FOREIGN KEY ("clientId") REFERENCES "clients" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "insertion_requests_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "users_email_key" ON "users"("email");

-- CreateIndex
CREATE UNIQUE INDEX "users_cpf_key" ON "users"("cpf");

-- CreateIndex
CREATE UNIQUE INDEX "clients_cnpj_cpf_key" ON "clients"("cnpj_cpf");

-- CreateIndex
CREATE UNIQUE INDEX "agencys_cnpj_cpf_key" ON "agencys"("cnpj_cpf");

-- CreateIndex
CREATE UNIQUE INDEX "agencys_email_key" ON "agencys"("email");

-- CreateIndex
CREATE UNIQUE INDEX "insertion_requests_insertion_request_key" ON "insertion_requests"("insertion_request");
