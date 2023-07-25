-- Create Tables

-- household

drop table if exists household;

create table
    household (
        email VARCHAR(255) NOT NULL,
        square_footage INTEGER NOT NULL,
        p_code VARCHAR(5) NOT NULL,
        h_type VARCHAR(255) NOT NULL,
        heat_setting INTEGER,
        cool_setting INTEGER,

        PRIMARY KEY (email)
    );

-- household_utilites
drop table
    if exists household_utility;

create table
    household_utility (
        email VARCHAR(255) NOT NULL,
        utility VARCHAR(255) NOT NULL
    );

-- postal_code
drop table
    if exists postal_code;

create table
    postal_code (
        p_code VARCHAR(5) NOT NULL,
        city VARCHAR(50) NOT NULL,
        state VARCHAR(50) NOT NULL,
        latitude FLOAT NOT NULL,
        longitude FLOAT NOT NULL,

        PRIMARY KEY (p_code)
    );

-- appliance
drop table if exists appliance;

create table
    appliance (
        email VARCHAR(255) NOT NULL,
        order_of_entry INTEGER NOT NULL,
        btu_rating INTEGER NOT NULL,
        manufacturer VARCHAR(50) NOT NULL,
        model_name VARCHAR(50),

        PRIMARY KEY pk_appliance (email, order_of_entry)
    );

-- air_conditioner
drop table
    if exists air_conditioner;

create table
    air_conditioner (
        email VARCHAR(255) NOT NULL,
        order_of_entry INTEGER NOT NULL,
        energy_efficiency_ratio FLOAT,

        PRIMARY KEY pk_air_conditioner (email, order_of_entry),
        KEY (order_of_entry)
    );

-- heater
drop table if exists heater;

create table
    heater (
        email VARCHAR(255) NOT NULL,
        order_of_entry INTEGER NOT NULL,
        source VARCHAR(255) NOT NULL,

        PRIMARY KEY pk_heater (email, order_of_entry),
        KEY (order_of_entry)
    );

-- heat_pump
drop table if exists heat_pump;

create table
    heat_pump (
        email VARCHAR(255) NOT NULL,
        order_of_entry INTEGER NOT NULL,
        seasonal_energy_efficiency_rating FLOAT NOT NULL,
        heating_seasonal_performance_factor FLOAT NOT NULL,

        PRIMARY KEY pk_heat_pump (email, order_of_entry),
        KEY (order_of_entry)
    );

-- water heater
drop table
    if exists water_heater;

create table
    water_heater(
        email VARCHAR(255) NOT NULL,
        order_of_entry INTEGER NOT NULL,
        capacity FLOAT NOT NULL,
        current_temperature_setting FLOAT,
        energy_source VARCHAR(255) NOT NULL,

        PRIMARY KEY pk_water_heater (email, order_of_entry),
        KEY (order_of_entry)
    );

-- power_generator
drop table
    if exists power_generator;

create table
    power_generator(
        email VARCHAR(255) NOT NULL,
        generation_type VARCHAR(255) NOT NULL,
        avg_monthly_kwh_generated INTEGER NOT NULL,
        order_of_entry INTEGER NOT NULL,
        battery_storage_capacity INTEGER,

        PRIMARY KEY pk_power_generator (email, order_of_entry),
        KEY (order_of_entry)
    );

-- manufacturer
drop table
    if exists manufacturer;

create table
    manufacturer (
        name VARCHAR(255) NOT NULL,
        KEY(name)
    );

-- Constrainsts

-- household_utility
alter table
    household_utility
ADD
    CONSTRAINT fk_household_household_utility FOREIGN KEY (email) REFERENCES household(email);

-- appliance
alter table appliance
ADD
    CONSTRAINT fk_appliance_manufacturer FOREIGN KEY appliance(manufacturer) REFERENCES manufacturer(name);

-- air conditioner
alter table air_conditioner
ADD
    CONSTRAINT fk_air_conditioner_appliance FOREIGN KEY (email, order_of_entry) REFERENCES appliance(email, order_of_entry) ON DELETE CASCADE;

-- heater
alter table heater
ADD
    CONSTRAINT fk_heater_appliance FOREIGN KEY (email, order_of_entry) REFERENCES appliance(email, order_of_entry) ON DELETE CASCADE;

-- heat pump
alter TABLE heat_pump
ADD
    CONSTRAINT fk_heat_pump_appliance FOREIGN KEY (email, order_of_entry) REFERENCES appliance(email, order_of_entry) ON DELETE CASCADE;

-- heater
alter TABLE water_heater
ADD
    CONSTRAINT fk_water_heater_appliance FOREIGN KEY (email, order_of_entry) REFERENCES appliance(email, order_of_entry) ON DELETE CASCADE;

-- power generator
alter TABLE power_generator
ADD
    CONSTRAINT fk_power_generator_household FOREIGN KEY (email) REFERENCES household(email);

INSERT INTO
    household (
        email,
        square_footage,
        p_code,
        h_type,
        heat_setting,
        cool_setting
    )
VALUES (
        'johndoe@example.com',
        1500,
        '90210',
        'Single-Family Home',
        72,
        72
    ), (
        'janedoe@example.com',
        800,
        '90210',
        'Apartment',
        70,
        null
    ), (
        'bobsmith@example.com',
        2000,
        '90210',
        'Duplex',
        null,
        68
    );

-- household_utilites
INSERT INTO
    household_utility (email, utility)
VALUES (
        'johndoe@example.com',
        'Electricity'
    ), (
        'janedoe@example.com',
        'Natural Gas'
    ), (
        'bobsmith@example.com',
        'Propane'
    );

-- postal_code
INSERT INTO
    postal_code (
        p_code,
        city,
        state,
        latitude,
        longitude
    )
VALUES (
        '90210',
        'Beverly Hills',
        'CA',
        34.0900,
        -118.4068
    ), (
        '10001',
        'New York',
        'NY',
        40.7500,
        -73.9965
    ), (
        '60611',
        'Chicago',
        'IL',
        41.8947,
        -87.6248
    );

-- manufacturer
INSERT INTO
    manufacturer (name)
VALUES ('LG'), ('Samsung'), ('Frigidaire'), ('Carrier'), ('Goodman');

-- appliance
INSERT INTO
    appliance (
        email,
        order_of_entry,
        btu_rating,
        manufacturer,
        model_name
    )
VALUES (
        -- air_conditioner 1
        'johndoe@example.com',
        1,
        12000,
        'LG',
        'LS120HXV'
    ), (
        -- heater 2
        'johndoe@example.com',
        2,
        8000,
        'Samsung',
        'AR08KSWSBWKN'
    ), (
        -- heat_pump 1
        'janedoe@example.com',
        1,
        5000,
        'Frigidaire',
        'FFRA0511R1'
    ), (
        -- air_conditioner 1
        'bobsmith@example.com',
        1,
        18000,
        'Carrier',
        '24ABB3'
    ), (
        -- heater 2
        'bobsmith@example.com',
        2,
        12000,
        'Goodman',
        'GSX130241'
    );

-- air_conditioner
INSERT INTO
    air_conditioner (
        email,
        order_of_entry,
        energy_efficiency_ratio
    )
VALUES ('johndoe@example.com', 1, 10.5), (
        'bobsmith@example.com',
        1,
        11.0
    );

-- heater
INSERT INTO
    heater (email, order_of_entry, source)
VALUES (
        'johndoe@example.com',
        2,
        'Electric'
    ), (
        'bobsmith@example.com',
        2,
        'Natural Gas'
    );

-- heat_pump
INSERT INTO
    heat_pump (
        email,
        order_of_entry,
        seasonal_energy_efficiency_rating,
        heating_seasonal_performance_factor
    )
VALUES (
        'janedoe@example.com',
        1,
        18.0,
        8.5
    );

-- water_heater
INSERT INTO
    water_heater (
        email,
        order_of_entry,
        capacity,
        current_temperature_setting,
        energy_source
    )
VALUES (
        'johndoe@example.com',
        2,
        40.0,
        120.0,
        'Electric'
    );

-- power_generator
INSERT INTO
    power_generator (
        email,
        generation_type,
        avg_monthly_kwh_generated,
        order_of_entry,
        battery_storage_capacity
    )
VALUES (
        'johndoe@example.com',
        'Solar',
        500,
        1,
        100
    ), (
        'bobsmith@example.com',
        'Wind',
        800,
        1,
        0
    );

